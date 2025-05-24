import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/login/pages/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/login/pages/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/login/pages/login_page.dart';
import 'package:my_social_app/views/login/pages/register_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/login/pages/verify_email_page.dart';

class AppLoginView extends StatefulWidget {
  const AppLoginView({
    super.key,
  });

  @override
  State<AppLoginView> createState() => _AppLoginViewState();
}

class _AppLoginViewState extends State<AppLoginView>{
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(const LoginByRefreshTokenAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Login>(
      converter: (store) => store.state.login,
      builder: (context,login){
        if(login.status == LoginStatus.loading) return const ApplicationLoadingPage();
        if(login.status == LoginStatus.notLogin){
          return StoreConnector<AppState, ActiveLoginPage>(
            converter: (store) => store.state.activeLoginPage,
            builder: (context,loginPage) => 
              loginPage == ActiveLoginPage.loginPage
                ? const LoginPage()
                : const RegisterPage(),
          );
        }
        if(!login.login!.isPrivacyPolicyApproved) return const ApprovePolicyPage();
        if(!login.login!.isTermsOfUseApproved) return const ApproveTermsOfUsePage();
        if(!login.login!.isEmailVerified) return const VerifyEmailPage();
        return const RootView();
      },
    );
  }
}