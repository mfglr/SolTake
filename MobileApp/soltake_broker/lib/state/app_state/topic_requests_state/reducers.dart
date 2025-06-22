import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/actions.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

Pagination<int, TopicRequestState> approveTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, ApproveTopicRequestSuccessAction action)
  => prev.removeOne(action.id);
Pagination<int, TopicRequestState> rejectTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, RejectTopicRequestSuccessAction action)
  => prev.removeOne(action.id);

Pagination<int, TopicRequestState> nextPendingTopicRequestsReducer(Pagination<int, TopicRequestState> prev, NextPendingTopicRequestsAction action)
  => prev.startLoadingNext();
Pagination<int, TopicRequestState> nextPendingTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, NextPendingTopicRequestsSuccessAction action)
  => prev.addNextPage(action.topicRequests);
Pagination<int, TopicRequestState> nextPendingTopicRequestsFailedReducer(Pagination<int, TopicRequestState> prev, NextPendingTopicRequestsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int, TopicRequestState> firstPendingTopicRequestsReducer(Pagination<int, TopicRequestState> prev, FirstPendingTopicRequestsAction action)
  => prev.startLoadingNext();
Pagination<int, TopicRequestState> firstPendingTopicRequestsSuccessReducer(Pagination<int, TopicRequestState> prev, FirstPendingTopicRequestsSuccessAction action)
  => prev.addfirstPage(action.topicRequests);
Pagination<int, TopicRequestState> firstPendingTopicRequestsFailedReducer(Pagination<int, TopicRequestState> prev, FirstPendingTopicRequestsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int, TopicRequestState>> topicRequestsReducers = combineReducers<Pagination<int, TopicRequestState>>([
  TypedReducer<Pagination<int, TopicRequestState>,ApproveTopicRequestSuccessAction>(approveTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,RejectTopicRequestSuccessAction>(rejectTopicRequestsSuccessReducer).call,

  TypedReducer<Pagination<int, TopicRequestState>,NextPendingTopicRequestsAction>(nextPendingTopicRequestsReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,NextPendingTopicRequestsSuccessAction>(nextPendingTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,NextPendingTopicRequestsFailedAction>(nextPendingTopicRequestsFailedReducer).call,

  TypedReducer<Pagination<int, TopicRequestState>,FirstPendingTopicRequestsAction>(firstPendingTopicRequestsReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,FirstPendingTopicRequestsSuccessAction>(firstPendingTopicRequestsSuccessReducer).call,
  TypedReducer<Pagination<int, TopicRequestState>,FirstPendingTopicRequestsFailedAction>(firstPendingTopicRequestsFailedReducer).call,
]);