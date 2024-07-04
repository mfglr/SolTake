import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/user_image_provider.dart';
import 'package:my_social_app/providers/user_provider.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/login_view.dart';
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

Future<void> main() async {
  await loadEnvironmentVariables();

  PlatformDispatcher.instance.onError = (error, stack) {
    ToastCreator.displayError(error.toString());
    return true;
  };

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  
  final AccountProvider _stateManager = AccountProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<UserImageProvider>(create: (_) => UserImageProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: _stateManager.init(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case(ConnectionState.done):
                if(_stateManager.state == null) {
                  return const LoginView();
                }
                if(!(_stateManager.state!.emailConfirmed)){
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
          userPageroute: (context) => const UserPage()
        },
      ),
    );
  }
}

