import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:redux/redux.dart';

TopicEntityState addTopicsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsAction ? prev.addTopics(action.topics) : prev;

TopicEntityState addTopicsListsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsListAction ? prev.addLists(action.lists) : prev;

TopicEntityState nextPageOfTopicQuestionsSuccessReducer(TopicEntityState prev,Action action)
  => action is NextPageOfTopicQuestionsSuccessAction ? prev.loadQuestions(action.topicId, action.questionIds) : prev;

Reducer<TopicEntityState> topicEntityStateReducers = combineReducers<TopicEntityState>([
  TypedReducer<TopicEntityState,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<TopicEntityState,AddTopicsListAction>(addTopicsListsReducer).call,
  TypedReducer<TopicEntityState,NextPageOfTopicQuestionsSuccessAction>(nextPageOfTopicQuestionsSuccessReducer).call,
]);