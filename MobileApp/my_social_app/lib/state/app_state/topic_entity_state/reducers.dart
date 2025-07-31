import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,TopicState> addTopicReducer(EntityState<int,TopicState> prev,AddTopicAction action)
  => prev.appendOne(action.topic);
EntityState<int,TopicState> addTopicsReducer(EntityState<int,TopicState> prev,AddTopicsAction action)
  => prev.appendMany(action.topics);
EntityState<int,TopicState> addTopicsListsReducer(EntityState<int,TopicState> prev,AddTopicsListAction action)
  => prev.appendList(action.lists);

Reducer<EntityState<int,TopicState>> topicEntityStateReducers = combineReducers<EntityState<int,TopicState>>([
  TypedReducer<EntityState<int,TopicState>,AddTopicAction>(addTopicReducer).call,
  TypedReducer<EntityState<int,TopicState>,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<EntityState<int,TopicState>,AddTopicsListAction>(addTopicsListsReducer).call,
]);