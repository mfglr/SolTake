import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,TopicState> nextQuestionsReducer(EntityState<int,TopicState> prev,NextTopicQuestionsAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.startLoadingNextQuestions());
EntityState<int,TopicState> nextQuestionsSuccessReducer(EntityState<int,TopicState> prev,NextTopicQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.addNextQuestions(action.questionIds));
EntityState<int,TopicState> nextQuestionsFailedReducer(EntityState<int,TopicState> prev,NextTopicQuestionFailedAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.stopLoadingNextQuestions());

EntityState<int,TopicState> prevQuestionsReducer(EntityState<int,TopicState> prev,PrevTopicQuestionsAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.startLoadingPrevQuestions());
EntityState<int,TopicState> prevQuestionsSuccessReducer(EntityState<int,TopicState> prev,PrevTopicQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.addPrevQuestions(action.questionIds));
EntityState<int,TopicState> prevQuestionsFailedReducer(EntityState<int,TopicState> prev,PrevTopicQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.stopLoadingPrevQuestions());

EntityState<int,TopicState> addTopicReducer(EntityState<int,TopicState> prev,AddTopicAction action)
  => prev.appendOne(action.topic);
EntityState<int,TopicState> addTopicsReducer(EntityState<int,TopicState> prev,AddTopicsAction action)
  => prev.appendMany(action.topics);
EntityState<int,TopicState> addTopicsListsReducer(EntityState<int,TopicState> prev,AddTopicsListAction action)
  => prev.appendList(action.lists);

Reducer<EntityState<int,TopicState>> topicEntityStateReducers = combineReducers<EntityState<int,TopicState>>([
  TypedReducer<EntityState<int,TopicState>,NextTopicQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<EntityState<int,TopicState>,NextTopicQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<EntityState<int,TopicState>,NextTopicQuestionFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<EntityState<int,TopicState>,PrevTopicQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<EntityState<int,TopicState>,PrevTopicQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<EntityState<int,TopicState>,PrevTopicQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<EntityState<int,TopicState>,AddTopicAction>(addTopicReducer).call,
  TypedReducer<EntityState<int,TopicState>,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<EntityState<int,TopicState>,AddTopicsListAction>(addTopicsListsReducer).call,
]);