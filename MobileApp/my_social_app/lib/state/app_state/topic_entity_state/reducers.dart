import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_entity_state.dart';
import 'package:redux/redux.dart';

TopicEntityState getNextPageQuestionsReducer(TopicEntityState prev,GetNextPageTopicQuestionsAction action)
  => prev.getNextPageQuestions(action.topicId);
TopicEntityState addNextPageQuestionsReducer(TopicEntityState prev,AddNextPageTopicQuestionsAction action)
  => prev.addNextPageQuestions(action.topicId, action.questionIds);

TopicEntityState getPrevPageQuestionsReducer(TopicEntityState prev,GetPrevPageTopicQuestionsAction action)
  => prev.getPrevPageQuestions(action.topicId);
TopicEntityState addPrevPageQuestionsReducer(TopicEntityState prev,AddPrevPageTopicQuestionsAction action)
  => prev.addPrevPageQuestions(action.topicId,action.questionIds);

TopicEntityState addTopicsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsAction ? prev.addTopics(action.topics) : prev;
TopicEntityState addTopicsListsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsListAction ? prev.addLists(action.lists) : prev;

Reducer<TopicEntityState> topicEntityStateReducers = combineReducers<TopicEntityState>([
  TypedReducer<TopicEntityState,GetNextPageTopicQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<TopicEntityState,AddNextPageTopicQuestionsAction>(addNextPageQuestionsReducer).call,

  TypedReducer<TopicEntityState,GetPrevPageTopicQuestionsAction>(getPrevPageQuestionsReducer).call,
  TypedReducer<TopicEntityState,AddPrevPageTopicQuestionsAction>(addPrevPageQuestionsReducer).call,

  TypedReducer<TopicEntityState,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<TopicEntityState,AddTopicsListAction>(addTopicsListsReducer).call,
]);