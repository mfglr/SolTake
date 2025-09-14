import 'package:my_social_app/services/topic_request_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_requests_state/actions.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_status.dart';
import 'package:redux/redux.dart';

void createTopicRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateTopicRequestAction){
    TopicRequestService
      .create(action.subject.id, action.name)
      .then((e) => store.dispatch(CreateTopicRequestSuccessAction(
        topicRequest: TopicRequestState(
          id: e.id,
          createdAt: DateTime.now(),
          name: action.subject.name,
          subjectName: action.name,
          state: TopicRequestStatus.pending,
          reason: null
        )
      )));
  }
  next(action);
}

void deletTopicRequestMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteTopicRequestAction){
    TopicRequestService
      .delete(action.id)
      .then((_) => store.dispatch(DeleteTopicRequestSuccessAction(id: action.id)));
  }
  next(action);
}

void nextTopicRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextTopicRequestsAction){
    TopicRequestService
      .getTopicRequests(store.state.topicRequests.next)
      .then((e) => store.dispatch(NextTopicRequestsSuccessAction(topicRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextTopicRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstTopicRequestsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstTopicRequestsAction){
    TopicRequestService
      .getTopicRequests(store.state.topicRequests.first)
      .then((e) => store.dispatch(FirstTopicRequestsSuccessAction(topicRequests: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const FirstTopicRequestsFailedAction());
        throw e;
      });
  }
  next(action);
}
