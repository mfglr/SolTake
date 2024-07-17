import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/user_entity_state/user_entity_state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

enum ActiveLoginPage{
  loginPage,
  registerPage
}

@immutable
class AppState{
  final String? accessToken;
  final AccountState? accountState;
  final ActiveLoginPage activeLoginPage;
  final bool isInitialized;
  final UserEntityState userEntityState;
  final SearchState searchState;
  final CreateQuestionState createQuestionState;
  final ExamEntityState examEntityState;
  final SubjectEntityState subjectEntityState;
  final TopicEntityState topicEntityState;
  final QuestionEntityState questionEntityState;

  const AppState({
    required this.accessToken,
    required this.accountState,
    required this.activeLoginPage,
    required this.isInitialized,
    required this.userEntityState,
    required this.searchState,
    required this.createQuestionState,
    required this.examEntityState,
    required this.subjectEntityState,
    required this.topicEntityState,
    required this.questionEntityState
  });

  UserState? get currentUser => userEntityState.users[accountState!.id];
  List<UserState> get searchedUsers => searchState.users.ids.map((e) => userEntityState.users[e]!).toList();
  
  bool get areSubjectsLoaded 
    => createQuestionState.examId != null ? subjectEntityState.isLoaded(createQuestionState.examId) : false;
  List<String> get nameOfSubjects
    => subjectEntityState.getSubjectsByExamId(createQuestionState.examId).map((x) => x.name).toList();
  List<SubjectState> get subjects
    => subjectEntityState.getSubjectsByExamId(createQuestionState.examId);

  List<TopicState> get topics => topicEntityState.getTopics(createQuestionState.subjectId).toList();

  List<QuestionState> getUserQuestions(int userId){
    final ids = userEntityState.users[userId]!.questions.ids;
    return ids.map((e) => questionEntityState.questions[e]!).toList(); 
  }

  Iterable<QuestionState> get questionsOfCurrentUser
    => accountState != null ? getUserQuestions(accountState!.id) : [];
  Iterable<TopicState> getTopicsOfQuestions(int questionId)
    => questionEntityState.questions[questionId]!.topics.map((e) => topicEntityState.topics[e]!);
  
}