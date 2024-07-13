import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/exams_state/exams_state.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

enum ActiveLoginPage{
  loginPage,
  registerPage
}

@immutable
class AppState{
  final AccountState? accountState;
  final ActiveLoginPage activeLoginPage;
  final bool isInitialized;
  final UserEntityState userEntityState;
  final SearchState searchState;
  final CreateQuestionState createQuestionState;
  final ExamsState examsState;

  UserState? get currentUser => userEntityState.users[accountState!.id];
  List<UserState> get searchedUsers => searchState.users.ids.map((e) => userEntityState.users[e]!).toList(); 

  const AppState({
    required this.accountState,
    required this.activeLoginPage,
    required this.isInitialized,
    required this.userEntityState,
    required this.searchState,
    required this.createQuestionState,
    required this.examsState
  });
}