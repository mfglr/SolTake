import 'package:my_social_app/state/app_state/subject_request_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,SubjectRequestState> createSubjectRequestsSuccessReducers(Pagination<int, SubjectRequestState> prev, CreateSubjectRequestSuccessAction action)
  => prev.prependOne(action.subjectRequest);

Pagination<int,SubjectRequestState> nextSubjectRequestsReducers(Pagination<int, SubjectRequestState> prev, NextSubjectRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,SubjectRequestState> nextSubjectRequestsSuccessReducer(Pagination<int, SubjectRequestState> prev, NextSubjectRequestsSuccessAction action)
  => prev.addNextPage(action.subjectRequests);
Pagination<int,SubjectRequestState> nextSubjectRequestsFailedReducer(Pagination<int,SubjectRequestState> prev, NextSubjectRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SubjectRequestState> firstSubjectRequestsReducers(Pagination<int, SubjectRequestState> prev, FirstSubjectRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,SubjectRequestState> firstSubjectRequestsSuccessReducer(Pagination<int, SubjectRequestState> prev, FirstSubjectRequestsSuccessAction action)
  => prev.refreshPage(action.subjectRequests);
Pagination<int,SubjectRequestState> firstSubjectRequestsFailedReducer(Pagination<int,SubjectRequestState> prev, FirstSubjectRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SubjectRequestState> deleteSubjectRequestSuccessReducer(Pagination<int,SubjectRequestState> prev, DeleteSubjectRequestSuccessAction action)
  => prev.removeOne(action.id);


Reducer<Pagination<int,SubjectRequestState>> subjectRequestsReducers = combineReducers<Pagination<int,SubjectRequestState>>([
  TypedReducer<Pagination<int,SubjectRequestState>,CreateSubjectRequestSuccessAction>(createSubjectRequestsSuccessReducers).call,

  TypedReducer<Pagination<int,SubjectRequestState>,NextSubjectRequestsAction>(nextSubjectRequestsReducers).call,
  TypedReducer<Pagination<int,SubjectRequestState>,NextSubjectRequestsSuccessAction>(nextSubjectRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,SubjectRequestState>,NextSubjectRequestsFailedAction>(nextSubjectRequestsFailedReducer).call,

  TypedReducer<Pagination<int,SubjectRequestState>,FirstSubjectRequestsAction>(firstSubjectRequestsReducers).call,
  TypedReducer<Pagination<int,SubjectRequestState>,FirstSubjectRequestsSuccessAction>(firstSubjectRequestsSuccessReducer).call,
  TypedReducer<Pagination<int,SubjectRequestState>,FirstSubjectRequestsFailedAction>(firstSubjectRequestsFailedReducer).call,

  TypedReducer<Pagination<int,SubjectRequestState>,DeleteSubjectRequestSuccessAction>(deleteSubjectRequestSuccessReducer).call,
]);