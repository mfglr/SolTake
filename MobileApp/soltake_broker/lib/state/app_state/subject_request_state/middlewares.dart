import 'package:redux/redux.dart';
import 'package:soltake_broker/services/subject_requests_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/actions.dart';

void approveSubjectRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ApproveSubjectRequestAction){
    SubjectRequestsService
      .approve(action.id)
      .then((_) => store.dispatch(ApproveSubjectRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void rejectSubjectRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RejectSubjectRequestAction){
    SubjectRequestsService
      .reject(action.id, action.reason)
      .then((_) => store.dispatch(RejectSubjectRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void nextPendingSubjectRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextPendingSubjectRequestsAction){
    SubjectRequestsService
      .getPendings(store.state.subjectRequests.next)
      .then((e) => store.dispatch(NextPendingSubjectRequestsSuccessAction(subjectRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextPendingSubjectRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstPendingSubjectRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstPendingSubjectRequestsAction){
    SubjectRequestsService
      .getPendings(store.state.subjectRequests.first)
      .then((e) => store.dispatch(FirstPendingSubjectRequestsSuccessAction(subjectRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstPendingSubjectRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}