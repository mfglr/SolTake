import 'dart:async';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/global_error_handling.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_content_page.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/account/login_view.dart';
import 'package:my_social_app/views/create_question/pages/add_question_images_page.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page.dart';
import 'package:my_social_app/views/message/pages/take_message_image_page.dart';
import 'package:my_social_app/views/account/register_view.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/account/verify_email_view.dart';
import 'package:my_social_app/views/take_image_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  
  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        locale: Locale(PlatformDispatcher.instance.locale.languageCode),
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
        home: StoreConnector<AppState,bool>(
          onInit: (store) => store.dispatch(const InitAppAction()),
          converter: (store) => store.state.isInitialized,
          builder: (context, isInitialized){
            if(isInitialized){
              return StoreConnector<AppState,AccountState?>(
                converter: (store) => store.state.accountState,
                builder: (context,accountState){
                  if(accountState == null){
                    return StoreConnector<AppState,ActiveLoginPage>(
                      converter: (store) => store.state.activeLoginPage,
                      builder: (context,activeLoginPage){
                        if(activeLoginPage == ActiveLoginPage.loginPage) return const LoginView();
                        return const RegisterView();
                      },
                    );
                  }
                  if(!accountState.emailConfirmed) return const VerifyEmailView();
                  return const RootView();
                },
              );
            }
            return const LoadingView();
          }
        ),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          rootRoute: (context) => const RootView(),

          displayQuestionImagesRoute: (context) => const AddQuestionImagesPage(),
          selectTopicRoute: (context) => const SelectTopicPage(),
          selectExamRoute: (context) => const SelectExamPage(),
          
          addSolutionImagesRoute: (context) => const AddSolutionImagesPage(),
          addSolutionContentRoute: (context) => const AddSolutionContentPage(),

          takeMessageImageRoute: (context) => TakeMessageImagePage(camera: cameras.first),

          takeImageRoute: (context) => TakeImagePage(camera: cameras.first)
        },
      ),
    )
  );
}
