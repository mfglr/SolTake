import 'package:flutter/widgets.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

@immutable
class AppState {
  final LoginState? login;

  const AppState({
    required this.login
  });


  AppState clear() => AppState(
    login: null,
  );

}