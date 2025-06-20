import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

Pagination<int,ExamRequestState> nextPendingExamRequestsReducer(Pagination<int,ExamRequestState> prev, NextPendingExamRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,ExamRequestState> nextPendingExamRequestsSuccessReducer(Pagination<int,ExamRequestState> prev, NextPendingExamRequestsSuccessAction action)
  => prev.addNextPage(action.examRequets);
Pagination<int,ExamRequestState> nextPendingExamRequestsFailedReducer(Pagination<int,ExamRequestState> prev, NextPendingExamRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,ExamRequestState> firstPendingExamRequestsReducer(Pagination<int,ExamRequestState> prev, FirstPendingExamRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,ExamRequestState> firstPendingExamRequestsSuccessReducer(Pagination<int,ExamRequestState> prev, FirstPendingExamRequestsSuccessAction action)
  => prev.addfirstPage(action.examRequets);
Pagination<int,ExamRequestState> firstPendingExamRequestsFailedReducer(Pagination<int,ExamRequestState> prev, FirstPendingExamRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,ExamRequestState> approveExamRequestSuccessReducer(Pagination<int,ExamRequestState> prev, ApproveExamRequestSuccessAction action)
  => prev.removeOne(action.id);
Pagination<int,ExamRequestState> rejectExamRequestSuccessReducer(Pagination<int,ExamRequestState> prev, RejectExamRequestSuccessAction action)
  => prev.removeOne(action.id);

Reducer<Pagination<int,ExamRequestState>> examRequestsReducers = combineReducers([
  TypedReducer<Pagination<int,ExamRequestState>,NextPendingExamRequestsAction>(nextPendingExamRequestsReducer).call,
  TypedReducer<Pagination<int,ExamRequestState>,NextPendingExamRequestsSuccessAction>(nextPendingExamRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,ExamRequestState>,NextPendingExamRequestsFailedAction>(nextPendingExamRequestsFailedReducer).call,

  TypedReducer<Pagination<int,ExamRequestState>,FirstPendingExamRequestsAction>(firstPendingExamRequestsReducer).call,
  TypedReducer<Pagination<int,ExamRequestState>,FirstPendingExamRequestsSuccessAction>(firstPendingExamRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,ExamRequestState>,FirstPendingExamRequestsFailedAction>(firstPendingExamRequestsFailedReducer).call,

  TypedReducer<Pagination<int,ExamRequestState>,ApproveExamRequestSuccessAction>(approveExamRequestSuccessReducer).call,
  TypedReducer<Pagination<int,ExamRequestState>,RejectExamRequestSuccessAction>(rejectExamRequestSuccessReducer).call,
]);