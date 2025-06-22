import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/reducers.dart';
import 'package:soltake_broker/state/app_state/login_state/reducers.dart';
import 'package:soltake_broker/state/app_state/question_state/reducers.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/reducers.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/reducers.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/reducers.dart';

AppState clearStateReducer(AppState prev, ClearStateAction action) =>
  prev.clear();

AppState appReducer(AppState prev, AppAction action) => 
  AppState(
    login: loginReducers(prev.login, action),
    questions: questionReducers(prev.questions, action),
    examRequests: examRequestsReducers(prev.examRequests, action),
    subjectRequests: subjectRequestsReducers(prev.subjectRequests, action),
    topicRequests: topicRequestsReducers(prev.topicRequests, action),
    questionUserComplaints: questionUserComplaintReducers(prev.questionUserComplaints, action) 
  );

Reducer<AppState> reducers = combineReducers<AppState>([
  TypedReducer<AppState, ClearStateAction>(clearStateReducer).call,
  TypedReducer<AppState, AppAction>(appReducer).call
]);