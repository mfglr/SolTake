import 'package:redux/redux.dart';
import 'package:soltake_broker/services/exam_request_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';

void nextPendingExamRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextPendingExamRequestsAction){
    ExamRequestService
      .getPendingExamRequests(store.state.examRequests.next)
      .then((e) => store.dispatch(NextPendingExamRequestsSuccessAction(examRequets: e.map((t) => t.toState()))))
      .catchError((e){
        store.dispatch(const NextPendingExamRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstPendingExamRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstPendingExamRequestsAction){
    ExamRequestService
      .getPendingExamRequests(store.state.examRequests.first)
      .then((e) => store.dispatch(FirstPendingExamRequestsSuccessAction(examRequets: e.map((t) => t.toState()))))
      .catchError((e){
        store.dispatch(const FirstPendingExamRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void approveExamRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ApproveExamRequestAction){
    ExamRequestService
      .approve(action.id)
      .then((_) => store.dispatch(ApproveExamRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void rejectExamRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RejectExamRequestAction){
    ExamRequestService
      .reject(action.id)
      .then((_) => store.dispatch(RejectExamRequestSuccessAction(id: action.id)));
  }
  next(action);
}