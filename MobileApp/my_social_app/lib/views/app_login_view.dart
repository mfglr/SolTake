import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/login/pages/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/login/pages/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/login/pages/login_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/login/pages/verify_email_page.dart';

class AppLoginView extends StatefulWidget {
  final Login login;
  const AppLoginView({
    super.key,
    required this.login,
  });

  @override
  State<AppLoginView> createState() => _AppLoginViewState();
}

class _AppLoginViewState extends State<AppLoginView>{
  late final Timer _timer;

  @override
  void initState() {
    

    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(const LoginByRefreshTokenAction());
    
    _timer = Timer.periodic(
      Duration(minutes: int.parse(dotenv.env['accessTokenDuration']!)),
      (timer) => store.dispatch(const LoginByRefreshTokenAction())
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.login.status == LoginStatus.loading) return const ApplicationLoadingPage();
    if(widget.login.status == LoginStatus.notLogin) return const LoginPage();

    if(!widget.login.login!.isPrivacyPolicyApproved) return const ApprovePolicyPage();
    if(!widget.login.login!.isTermsOfUseApproved) return const ApproveTermsOfUsePage();
    if(!widget.login.login!.isEmailVerified) return const VerifyEmailPage();
    return const RootView();
  }
}