import 'package:flutter/material.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/storage/storage.dart';
import 'package:my_social_app/views/home_view.dart';
import 'package:my_social_app/views/login_view.dart';
import 'package:my_social_app/views/verify_email_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late final Storage storage;

  @override
  void initState() {
    storage = getIt<Storage>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: login(),
      builder: (context, snapshot) {
        if(account == null) {
          return const LoginView();
        }
        if(!(account!.emailConfirmed)){
          return const VerifyEmailView();
        }
        return const HomeView();
      }
    );
  }
}

