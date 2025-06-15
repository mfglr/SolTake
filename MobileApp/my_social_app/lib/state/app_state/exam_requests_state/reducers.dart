import 'package:my_social_app/state/app_state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, ExamRequestState> createExamRequestSuccessReducer(Pagination<int, ExamRequestState> prev, CreateExamRequestSuccessAction action)
  => prev.prependOne(action.examRequest);

Pagination<int,ExamRequestState> nextExamRequestsReducer(Pagination<int,ExamRequestState> prev, NextExamRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,ExamRequestState> nextExamRequestsSuccessReducer(Pagination<int,ExamRequestState> prev, NextExamRequestsSuccessAction action)
  => prev.addNextPage(action.examRequests);
Pagination<int,ExamRequestState> nextExamRequestsFailedReducer(Pagination<int,ExamRequestState> prev, NextExamRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,ExamRequestState> firstExamRequestsReducer(Pagination<int,ExamRequestState> prev, FirstExamRequestsAction action)
  => prev.startLoadingNext();
Pagination<int,ExamRequestState> firstExamRequestsSuccessReducer(Pagination<int,ExamRequestState> prev, FirstExamRequestsSuccessAction action)
  => prev.addfirstPage(action.examRequests);
Pagination<int,ExamRequestState> firstExamRequestsFailedReducer(Pagination<int,ExamRequestState> prev, FirstExamRequestsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int, ExamRequestState>> examRequestReducers = combineReducers<Pagination<int, ExamRequestState>>([
  TypedReducer<Pagination<int, ExamRequestState>,CreateExamRequestSuccessAction>(createExamRequestSuccessReducer).call,

  TypedReducer<Pagination<int, ExamRequestState>,NextExamRequestsAction>(nextExamRequestsReducer).call,
  TypedReducer<Pagination<int, ExamRequestState>,NextExamRequestsSuccessAction>(nextExamRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, ExamRequestState>,NextExamRequestsFailedAction>(nextExamRequestsFailedReducer).call,

  TypedReducer<Pagination<int, ExamRequestState>,FirstExamRequestsAction>(firstExamRequestsReducer).call,
  TypedReducer<Pagination<int, ExamRequestState>,FirstExamRequestsSuccessAction>(firstExamRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, ExamRequestState>,FirstExamRequestsFailedAction>(firstExamRequestsFailedReducer).call,
]);