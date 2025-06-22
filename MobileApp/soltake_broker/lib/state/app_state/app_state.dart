import 'package:flutter/widgets.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart' show ExamRequestState;
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

@immutable
class AppState {
  final LoginContainer login;
  final Pagination<int,QuestionState> questions;
  final Pagination<int,ExamRequestState> examRequests;
  final Pagination<int,SubjectRequestState> subjectRequests;
  final Pagination<int,TopicRequestState> topicRequests;

  const AppState({
    required this.login,
    required this.questions,
    required this.examRequests,
    required this.subjectRequests,
    required this.topicRequests
  });

  AppState clear() => AppState(
    login: LoginContainer.init(),
    questions: Pagination.init(100, false),
    examRequests: Pagination.init(20, false),
    subjectRequests: Pagination.init(20, false),
    topicRequests: Pagination.init(20, false),
  );

}