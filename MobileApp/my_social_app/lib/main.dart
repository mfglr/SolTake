import 'dart:async';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/user_image_provider.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/login_view.dart';
import 'package:my_social_app/views/pages/create_question/take_picture_page.dart';
import 'package:my_social_app/views/pages/profile_page.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/register_view.dart';
import 'package:my_social_app/views/pages/user/user_followeds_page.dart';
import 'package:my_social_app/views/pages/user/user_followers_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/verify_email_view.dart';
import 'package:provider/provider.dart';


Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AccountProvider stateManager = AccountProvider();
  final List<CameraDescription> cameras = await availableCameras();
  await loadEnvironmentVariables();


  PlatformDispatcher.instance.onError = (error, stack) {
    ToastCreator.displayError(error.toString());
    return true;
  };

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
        ChangeNotifierProvider<UserImageProvider>(create: (_) => UserImageProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: stateManager.init(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case(ConnectionState.done):
                if(stateManager.state == null) {
                  return const LoginView();
                }
                if(!(stateManager.state!.emailConfirmed)){
                  return const VerifyEmailView();
                }
                return const RootView();
              default:
                return const LoadingView();
            }
          }
        ),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          rootRoute: (context) => const RootView(),
          profilePageRoute: (context) => const ProfilePage(),
          userFollowersRoute: (context) => const UserFollowersPage(),
          userFollowedsRoute: (context) => const UserFollowedsPage(),
          userPageRoute: (context) => const UserPage(),
          takePictureRoute: (context) => TakePicturePage(camera: cameras.first)
        },
      ),
    )
  );
}
