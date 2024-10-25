import 'dart:async';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/global_error_handling.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/account/application_loading_page/application_loading_page.dart';
import 'package:my_social_app/views/account/approve_privacy_policy_page/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/account/approve_terms_of_use_page/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/account/register_page/register_page.dart';
import 'package:my_social_app/views/account/login_page/login_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/account/verify_email_page.dart/verify_email_page.dart';
import 'package:my_social_app/views/take_image_page/take_image_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/take_video_page/take_vieo_page.dart';
import 'package:timeago/timeago.dart' as timeago;

Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

void addTimeAgo(){
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  timeago.setLocaleMessages('tr', timeago.TrShortMessages());
}

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  await loadEnvironmentVariables();
  addTimeAgo();

  FlutterError.onError = (error) {
    handleErrors(error.exception);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    handleErrors(error);
    return true;
  };

  runApp(AppView(cameras: cameras));
}


class AppView extends StatelessWidget {
  final List<CameraDescription> cameras;
  const AppView({
    super.key,
    required this.cameras
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState,AccountState?>(
        onInit: (store) => store.dispatch(const LoginByRefreshToken()),
        converter: (store) => store.state.accountState,
        builder: (context,account) => MaterialApp(
          title: 'SolTake', 
          locale: Locale(account?.language ?? PlatformDispatcher.instance.locale.languageCode),
          supportedLocales: const [
            Locale('en'),
            Locale('tr'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainView(account: account),
          routes: {
            takeImageRoute: (context) => TakeImagePage(cameras: cameras),
            takeVideoRoute: (context) => TakeVieoPage(cameras: cameras)
          },
        ),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  final AccountState? account;
  const MainView({
    super.key,
    required this.account,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
   late final Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(
      Duration(minutes: int.parse(dotenv.env['accessTokenDuration']!)),
      (timer){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const LoginByRefreshToken());
      }
    );
    DefaultCacheManager().emptyCache();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,bool>(
      converter: (store) => store.state.isInitialized,
      builder: (context, isInitialized){
        if(isInitialized){
          if(widget.account == null){
            return StoreConnector<AppState,ActiveLoginPage>(
              converter: (store) => store.state.loginState.activeLoginPage,
              builder: (context,activeLoginPage){
                if(activeLoginPage == ActiveLoginPage.appLodingPage) return const ApplicationLoadingPage();
                if(activeLoginPage == ActiveLoginPage.loginPage) return const LoginPage();
                return const RegisterPage();
              },
            );
          }
          if(!widget.account!.isPrivacyPolicyApproved) return const ApprovePolicyPage();
          if(!widget.account!.isTermsOfUseApproved) return const ApproveTermsOfUsePage();
          if(!widget.account!.isThirdPartyAuthenticated && !widget.account!.emailConfirmed) return const VerifyEmailPage();
          if(widget.account!.accountDeletionStart) return const ApplicationLoadingPage();
          return const RootView();
        }
        return const ApplicationLoadingPage();
      }
    );
  }
}