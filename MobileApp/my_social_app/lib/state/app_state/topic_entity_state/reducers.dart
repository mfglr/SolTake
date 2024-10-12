import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_entity_state.dart';
import 'package:redux/redux.dart';

TopicEntityState nextQuestionsReducer(TopicEntityState prev,NextTopicQuestionsAction action)
  => prev.startLoadingNextQuestions(action.topicId);
TopicEntityState nextQuestionsSuccessReducer(TopicEntityState prev,NextTopicQuestionsSuccessAction action)
  => prev.addNextQuestions(action.topicId, action.questionIds);
TopicEntityState nextQuestionsFailedReducer(TopicEntityState prev,NextTopicQuestionFailedAction action)
  => prev.stopLoadingNextQuestions(action.topicId);

TopicEntityState prevQuestionsReducer(TopicEntityState prev,PrevTopicQuestionsAction action)
  => prev.startLoadingPrevQuestions(action.topicId);
TopicEntityState prevQuestionsSuccessReducer(TopicEntityState prev,PrevTopicQuestionsSuccessAction action)
  => prev.addPrevPageQuestions(action.topicId,action.questionIds);
TopicEntityState prevQuestionsFailedReducer(TopicEntityState prev,PrevTopicQuestionsFailedAction action)
  => prev.stopLoadingPrevQuestions(action.topicId);

TopicEntityState addTopicsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsAction ? prev.addTopics(action.topics) : prev;
TopicEntityState addTopicsListsReducer(TopicEntityState prev,Action action)
  => action is AddTopicsListAction ? prev.addLists(action.lists) : prev;

Reducer<TopicEntityState> topicEntityStateReducers = combineReducers<TopicEntityState>([
  TypedReducer<TopicEntityState,NextTopicQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<TopicEntityState,NextTopicQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<TopicEntityState,NextTopicQuestionFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<TopicEntityState,PrevTopicQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<TopicEntityState,PrevTopicQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<TopicEntityState,PrevTopicQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<TopicEntityState,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<TopicEntityState,AddTopicsListAction>(addTopicsListsReducer).call,
]);