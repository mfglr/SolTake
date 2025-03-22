import 'dart:async';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/global_error_handling.dart';
import 'package:my_social_app/services/package_version_service.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/app_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:take_media/pages/take_media_page.dart';
import 'package:take_media/pages/take_image_page.dart';
import 'package:timeago/timeago.dart' as timeago;

Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

void addTimeAgo(){
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  timeago.setLocaleMessages('tr_short', timeago.TrShortMessages());
}

late final String packageVersion;
Future _setPackageVersion() 
  => PackageVersionService()
      .getVersion()
      .then((version) => packageVersion = version);

Future<void> main() async {
    
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  await loadEnvironmentVariables();
  addTimeAgo();
  await _setPackageVersion();
  
  FlutterError.onError = (error) {
    handleErrors(error.exception);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    handleErrors(error);
    return true;
  };

  runApp(
    StoreProvider(
      store: store,
      child: StoreConnector<AppState,LoginState?>(
        onInit: (store){
          store.dispatch(const LoginByRefreshToken());
          Timer.periodic(
            Duration(minutes: int.parse(dotenv.env['accessTokenDuration']!)),
            (timer) => store.dispatch(const LoginByRefreshToken())
          );
        },
        converter: (store) => store.state.loginState,
        builder: (context,login) => MaterialApp(
          title: 'SolTake', 
          locale: Locale(login?.language ?? PlatformDispatcher.instance.locale.languageCode),
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
          home: AppView(login: login),
          routes: {
            takeMediaRoute: (context) => TakeMediaPage(cameras: cameras),
            takeImageRoute: (context) => TakeImagePage(cameras: cameras)
          },
        ),
      )
    )
  );
}
