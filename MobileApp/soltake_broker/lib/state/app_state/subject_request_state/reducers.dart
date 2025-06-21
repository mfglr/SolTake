import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

Pagination<int,SubjectRequestState> nextPendingSubjectRequestsReducers(Pagination<int, SubjectRequestState> prev, NextPendingSubjectRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,SubjectRequestState> nextPendingSubjectRequestsSuccessReducer(Pagination<int, SubjectRequestState> prev, NextPendingSubjectRequestsSuccessAction action)
  => prev.addNextPage(action.subjectRequests);
Pagination<int,SubjectRequestState> nextPendingSubjectRequestsFailedReducer(Pagination<int,SubjectRequestState> prev, NextPendingSubjectRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SubjectRequestState> firstPendingSubjectRequestsReducers(Pagination<int, SubjectRequestState> prev, FirstPendingSubjectRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,SubjectRequestState> firstPendingSubjectRequestsSuccessReducer(Pagination<int, SubjectRequestState> prev, FirstPendingSubjectRequestsSuccessAction action)
  => prev.addfirstPage(action.subjectRequests);
Pagination<int,SubjectRequestState> firstPendingSubjectRequestsFailedReducer(Pagination<int,SubjectRequestState> prev, FirstPendingSubjectRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SubjectRequestState> approveSubjectRequestSuccessReducer(Pagination<int,SubjectRequestState> prev, ApproveSubjectRequestSuccessAction action)
  => prev.removeOne(action.id);
Pagination<int,SubjectRequestState> rejectSubjectRequestSuccessReducer(Pagination<int,SubjectRequestState> prev, RejectSubjectRequestSuccessAction action)
  => prev.removeOne(action.id);

Reducer<Pagination<int,SubjectRequestState>> subjectRequestsReducers = combineReducers<Pagination<int,SubjectRequestState>>([
  TypedReducer<Pagination<int,SubjectRequestState>,NextPendingSubjectRequestsAction>(nextPendingSubjectRequestsReducers).call,
  TypedReducer<Pagination<int,SubjectRequestState>,NextPendingSubjectRequestsSuccessAction>(nextPendingSubjectRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,SubjectRequestState>,NextPendingSubjectRequestsFailedAction>(nextPendingSubjectRequestsFailedReducer).call,

  TypedReducer<Pagination<int,SubjectRequestState>,FirstPendingSubjectRequestsAction>(firstPendingSubjectRequestsReducers).call,
  TypedReducer<Pagination<int,SubjectRequestState>,FirstPendingSubjectRequestsSuccessAction>(firstPendingSubjectRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,SubjectRequestState>,FirstPendingSubjectRequestsFailedAction>(firstPendingSubjectRequestsFailedReducer).call,

  TypedReducer<Pagination<int,SubjectRequestState>,ApproveSubjectRequestSuccessAction>(approveSubjectRequestSuccessReducer).call,
  TypedReducer<Pagination<int,SubjectRequestState>,RejectSubjectRequestSuccessAction>(rejectSubjectRequestSuccessReducer).call,
]);