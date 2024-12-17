import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/main.dart';
import 'package:my_social_app/services/app_version_service.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/account/pages/application_loading_page.dart';
import 'package:my_social_app/views/account/pages/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/account/pages/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/account/pages/login_page.dart';
import 'package:my_social_app/views/account/pages/register_page.dart';
import 'package:my_social_app/views/account/pages/verify_email_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/update_app_page/update_app_page.dart';

class AppView extends StatefulWidget {
  final AccountState? account;
  const AppView({
    super.key,
    required this.account,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Future<bool> _isUpgradeRequired;
  @override
  void initState() {
    super.initState();
    _isUpgradeRequired = AppVersionService().isUpgradeRequired(packageInfo.version);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUpgradeRequired,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data!) return const UpdateAppPage();
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
                if(!widget.account!.isEmailVerified) return const VerifyEmailPage();
                if(widget.account!.accountDeletionStart) return const ApplicationLoadingPage();
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