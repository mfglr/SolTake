import 'package:flutter/widgets.dart';
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

@immutable
class AppState {
  final LoginContainer login;
  final Pagination<int,QuestionState> questions;

  const AppState({
    required this.login,
    required this.questions
  });

  AppState clear() => AppState(
    login: LoginContainer.init(),
    questions: Pagination.init(100, false) 
  );

}