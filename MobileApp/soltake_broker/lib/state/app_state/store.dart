import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';
import 'package:soltake_broker/state/app_state/login_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/question_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/reducers.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/middlewares.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

final store = Store(
  reducers,
  initialState: AppState(
    login: LoginContainer.init(),
    questions: Pagination.init(100, false),
    examRequests: Pagination.init(20, false),
    subjectRequests: Pagination.init(20, false),
    topicRequests: Pagination.init(20, false),
    questionUserComplaints: Pagination.init(20, false)
  ),
  middleware: [
    //login middlewares
    loginByPasswordMiddleware,
    loginByRefreshTokenMiddleware,

    //question middlewares
    nextAllDraftQuestionMiddleware,
    firstAllDraftQuestionsMiddleware,
    publishQuestionMiddleware,
    rejectQuestionMiddleware,
    deleteQuestionMiddleware,

    //exam requets
    nextPendingExamRequestsMiddleware,
    firstPendingExamRequestsMiddleware,
    approveExamRequestMiddleware,
    rejectExamRequestMiddleware,

    //subject requests
    approveSubjectRequestMiddleware,
    rejectSubjectRequestMiddleware,
    nextPendingSubjectRequestsMiddleware,
    firstPendingSubjectRequestsMiddleware,

    //topic requests
    approveTopicRequestMiddleware,
    rejectTopicRequestMiddleware,
    nextPendingTopicRequestsMiddleware,
    firstPendingTopicRequestsMiddleware,

    //question user complaints
    nextQuestionUserComplaintsMiddleware,
    firstQuestionUserComplaintsMiddleware
  ]
);