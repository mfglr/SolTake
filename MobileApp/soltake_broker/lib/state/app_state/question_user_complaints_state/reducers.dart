import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

Pagination<int,QuestionUserComplaintState> viewQuestionUserComplaintSuccessReducer(Pagination<int,QuestionUserComplaintState> prev, ViewQuestionUserComplaintsSuccessAction action)
  => prev.removeOne(action.id);

Pagination<int,QuestionUserComplaintState> nextQuestionUserComplaintsReducer(Pagination<int,QuestionUserComplaintState> prev, NextQuestionUserComplaintsAction action)
  => prev.startLoadingNext();
Pagination<int,QuestionUserComplaintState> nextQuestionUserComplaintsSuccessReducer(Pagination<int,QuestionUserComplaintState> prev, NextQuestionUserComplaintsSuccessAction action)
  => prev.addNextPage(action.questionUserComplaints);
Pagination<int,QuestionUserComplaintState> nextQuestionUserComplaintsFailedReducer(Pagination<int,QuestionUserComplaintState> prev, NextQuestionUserComplaintsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,QuestionUserComplaintState> firstQuestionUserComplaintsReducer(Pagination<int,QuestionUserComplaintState> prev, FirstQuestionUserComplaintsAction action)
  => prev.startLoadingNext();
Pagination<int,QuestionUserComplaintState> firstQuestionUserComplaintsSuccessReducer(Pagination<int,QuestionUserComplaintState> prev, FirstQuestionUserComplaintsSuccessAction action)
  => prev.addfirstPage(action.questionUserComplaints);
Pagination<int,QuestionUserComplaintState> firstQuestionUserComplaintsFailedReducer(Pagination<int,QuestionUserComplaintState> prev, FirstQuestionUserComplaintsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,QuestionUserComplaintState>> questionUserComplaintReducers = combineReducers<Pagination<int,QuestionUserComplaintState>>([
  TypedReducer<Pagination<int,QuestionUserComplaintState>,ViewQuestionUserComplaintsSuccessAction>(viewQuestionUserComplaintSuccessReducer).call,
  
  TypedReducer<Pagination<int,QuestionUserComplaintState>,NextQuestionUserComplaintsAction>(nextQuestionUserComplaintsReducer).call,
  TypedReducer<Pagination<int,QuestionUserComplaintState>,NextQuestionUserComplaintsSuccessAction>(nextQuestionUserComplaintsSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionUserComplaintState>,NextQuestionUserComplaintsFailedAction>(nextQuestionUserComplaintsFailedReducer).call,

  TypedReducer<Pagination<int,QuestionUserComplaintState>,FirstQuestionUserComplaintsAction>(firstQuestionUserComplaintsReducer).call,
  TypedReducer<Pagination<int,QuestionUserComplaintState>,FirstQuestionUserComplaintsSuccessAction>(firstQuestionUserComplaintsSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionUserComplaintState>,FirstQuestionUserComplaintsFailedAction>(firstQuestionUserComplaintsFailedReducer).call,
]);