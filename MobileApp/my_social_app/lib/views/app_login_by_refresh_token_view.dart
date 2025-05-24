import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/models/login.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/login_storage.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/login/pages/approve_privacy_policy_page.dart';
import 'package:my_social_app/views/login/pages/approve_terms_of_use_page.dart';
import 'package:my_social_app/views/login/pages/login_page.dart';
import 'package:my_social_app/views/root_view.dart';
import 'package:my_social_app/views/login/pages/verify_email_page.dart';

class AppLoginByRefreshTokenView extends StatefulWidget {
  const AppLoginByRefreshTokenView({
    super.key,
  });

  @override
  State<AppLoginByRefreshTokenView> createState() => _AppLoginByRefreshTokenViewState();
}

class _AppLoginByRefreshTokenViewState extends State<AppLoginByRefreshTokenView>{
  late final Timer _timer;
  LoginStatus _status = LoginStatus.loading;
  late LoginState _loginState;

  void _setLogin(Login login){
    final store = StoreProvider.of<AppState>(context,listen: false);
    final state = login.toLoginState();
    LoginStorage()
      .set(state)
      .then((_){
        AppClient().changeAccessToken(login.accessToken);
        MessageHub.init(login.accessToken, store);
        NotificationHub.init(login.accessToken, store);
        UserService().removeRefreshTokens(login.refreshToken);
        store.dispatch(UpdateLoginStateAction(payload: state));
      });
  }

  void _loginByRefrehsToken(){
    LoginStorage()
      .get()
      .then((login){
        if(login == null){
          setState(() => _status == LoginStatus.notLogin);
          return;
        }
        UserService()
          .loginByRefreshtoken(login.id, login.refreshToken)
          .then((login){
            final state = login.toLoginState();
            LoginStorage()
              .set(state)
              .then((_){
                _setLogin(login);
                setState((){
                  _status = LoginStatus.success;
                  _loginState = login.toLoginState();
                });
              });
          });
      });
  }

  @override
  void initState() {
    _loginByRefrehsToken();
    
    _timer = Timer.periodic(
      Duration(minutes: int.parse(dotenv.env['accessTokenDuration']!)),
      (timer){
        LoginStorage()
          .get()
          .then((login) => login!)
          .then((login){
            UserService()
              .loginByRefreshtoken(login.id, login.refreshToken)
              .then((login) => _setLogin(login));
          });
      }
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
    if(_status == LoginStatus.loading) return const ApplicationLoadingPage();
    if(_status == LoginStatus.notLogin) return const LoginPage();
   
    return StoreConnector<AppState,LoginState>(
      converter: (store) => store.state.login!
      builder: (),
    );

    if(_loginState.isPrivacyPolicyApproved) return const ApprovePolicyPage();
    if(_loginState.isTermsOfUseApproved) return const ApproveTermsOfUsePage();
    if(_loginState.isEmailVerified) return const VerifyEmailPage();
    return const RootView();
  }
}