import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/app_version_service.dart';
import 'package:my_social_app/services/package_version_service.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/login/pages/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/login/pages/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/login/pages/register_page.dart';
import 'package:my_social_app/views/login/pages/login_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/login/pages/verify_email_page.dart';
import 'package:my_social_app/views/update_app_page/update_app_page.dart';


class AppView extends StatefulWidget {
  final LoginState? login;
  const AppView({
    super.key,
    required this.login,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Future<bool> _isUpgradeRequired;
  @override
  void initState() {
    super.initState();
    _isUpgradeRequired = PackageVersionService()
      .getVersion()
      .then((version) => AppVersionService().isUpgradeRequired(version)); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUpgradeRequired,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data == null) return const ApplicationLoadingPage();
          if(snapshot.data!) return const UpdateAppPage();
          return StoreConnector<AppState,bool>(
            converter: (store) => store.state.isInitialized,
            builder: (context, isInitialized){
              if(isInitialized){
                if(widget.login == null){
                  return StoreConnector<AppState, ActiveAccountPage>(
                    converter: (store) => store.state.activeAccountPage,
                    builder: (context,activeAccountPage){
                      if(activeAccountPage == ActiveAccountPage.appLodingPage) return const ApplicationLoadingPage();
                      if(activeAccountPage == ActiveAccountPage.loginPage) return const LoginPage();
                      return const RegisterPage();
                    },
                  );
                }
                if(!widget.login!.isPrivacyPolicyApproved) return const ApprovePolicyPage();
                if(!widget.login!.isTermsOfUseApproved) return const ApproveTermsOfUsePage();
                if(!widget.login!.isEmailVerified) return const VerifyEmailPage();
                if(widget.login!.accountDeletionStart) return const ApplicationLoadingPage();
                return const RootView();
              }
              return const ApplicationLoadingPage();
            }
          );
        }
        return const ApplicationLoadingPage();
      }
    );
  }
}