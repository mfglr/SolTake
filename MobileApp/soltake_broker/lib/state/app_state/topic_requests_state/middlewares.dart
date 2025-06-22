import 'package:redux/redux.dart';
import 'package:soltake_broker/services/topic_request_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/actions.dart';

void approveTopicRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ApproveTopicRequestAction){
    TopicRequestService
      .approve(action.id)
      .then((_) => store.dispatch(ApproveTopicRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void rejectTopicRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RejectTopicRequestAction){
    TopicRequestService
      .reject(action.id, action.reason)
      .then((_) => store.dispatch(RejectTopicRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void nextPendingTopicRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextPendingTopicRequestsAction){
    TopicRequestService
      .getPendingTopicRequests(store.state.topicRequests.next)
      .then((e) => store.dispatch(NextPendingTopicRequestsSuccessAction(topicRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextPendingTopicRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstPendingTopicRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstPendingTopicRequestsAction){
    TopicRequestService
      .getPendingTopicRequests(store.state.topicRequests.first)
      .then((e) => store.dispatch(FirstPendingTopicRequestsSuccessAction(topicRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstPendingTopicRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}
