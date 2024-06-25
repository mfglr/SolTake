import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_social_app/Exceptions/backend_exception.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/views/home_view.dart';
import 'package:my_social_app/views/login_view.dart';
import 'package:my_social_app/views/register_view.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/toast_message_view.dart';
import 'package:my_social_app/views/verify_email_view.dart';

Future<void> main() async {
  await initApplication();

  PlatformDispatcher.instance.onError = (error, stack) {
    if(error is BackendException){
      ToastMessage.displayError(error.message);
    }
    else{
      ToastMessage.displayError(error.toString());
    }
    return true;
  };

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RootView(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
        '/verify-email/': (context) => const VerifyEmailView(),
        '/home/': (context) => const HomeView()
      },
    );
  }
}

