import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_image_entity_state/question_image_entity_state.dart';
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
  final QuestionImageEntityState questionImageEntityState;

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
    required this.questionEntityState,
    required this.questionImageEntityState
  });

  UserState? get currentUser => userEntityState.entities[accountState!.id];
  Iterable<UserState> get searchedUsers => searchState.users.ids.map((e) => userEntityState.entities[e]!);
  Iterable<QuestionState> getUserQuestions(int userId)
    => userEntityState.entities[userId]!.questions.ids.map((e) => questionEntityState.entities[e]!); 

  Iterable<TopicState> getTopicsOfQuestions(int questionId)
    => questionEntityState.entities[questionId]!.topics.map((e) => topicEntityState.entities[e]!);

  
  Iterable<SubjectState> get subjectsOfSelectedExam
    => examEntityState.entities[createQuestionState.examId!]!.subjects.ids.map((e) => subjectEntityState.entities[e]!);
  
  Iterable<TopicState> get topicsOfSelecetedSubject
    => topicEntityState.getSubjectTopics(createQuestionState.subjectId);
}