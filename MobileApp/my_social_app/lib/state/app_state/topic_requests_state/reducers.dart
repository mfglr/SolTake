import 'package:my_social_app/state/app_state/topic_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';



Pagination<int, TopicRequestState> createTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, CreateTopicRequestSuccessAction action)
  => prev.prependOne(action.topicRequest);
Pagination<int, TopicRequestState> deleteTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, DeleteTopicRequestSuccessAction action)
  => prev.removeOne(action.id);

Pagination<int, TopicRequestState> nextTopicRequestsReducer(Pagination<int, TopicRequestState> prev, NextTopicRequestsAction action)
  => prev.startLoadingNext();
Pagination<int, TopicRequestState> nextTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, NextTopicRequestsSuccessAction action)
  => prev.addNextPage(action.topicRequests);
Pagination<int, TopicRequestState> nextTopicRequestsFailedReducer(Pagination<int, TopicRequestState> prev, NextTopicRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int, TopicRequestState> firstTopicRequestsReducer(Pagination<int, TopicRequestState> prev, FirstTopicRequestsAction action)
  => prev.startLoadingNext();
Pagination<int, TopicRequestState> firstTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, FirstTopicRequestsSuccessAction action)
  => prev.refreshPage(action.topicRequests);
Pagination<int, TopicRequestState> firstTopicRequestsFailedReducer(Pagination<int, TopicRequestState> prev, FirstTopicRequestsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int, TopicRequestState>> topicRequestsReducers = combineReducers<Pagination<int, TopicRequestState>>([
  TypedReducer<Pagination<int, TopicRequestState>,CreateTopicRequestSuccessAction>(createTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,DeleteTopicRequestSuccessAction>(deleteTopicRequestsSuccessReducer).call,

  TypedReducer<Pagination<int, TopicRequestState>,NextTopicRequestsAction>(nextTopicRequestsReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,NextTopicRequestsSuccessAction>(nextTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,NextTopicRequestsFailedAction>(nextTopicRequestsFailedReducer).call,

  TypedReducer<Pagination<int, TopicRequestState>,FirstTopicRequestsAction>(firstTopicRequestsReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,FirstTopicRequestsSuccessAction>(firstTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,FirstTopicRequestsFailedAction>(firstTopicRequestsFailedReducer).call,
]);