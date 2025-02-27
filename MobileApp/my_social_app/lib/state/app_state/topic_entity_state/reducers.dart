import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,TopicState> nextQuestionsReducer(EntityState<num,TopicState> prev,NextTopicQuestionsAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.startLoadingNextQuestions());
EntityState<num,TopicState> nextQuestionsSuccessReducer(EntityState<num,TopicState> prev,NextTopicQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.addNextQuestions(action.questionIds));
EntityState<num,TopicState> nextQuestionsFailedReducer(EntityState<num,TopicState> prev,NextTopicQuestionFailedAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.stopLoadingNextQuestions());

EntityState<num,TopicState> prevQuestionsReducer(EntityState<num,TopicState> prev,PrevTopicQuestionsAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.startLoadingPrevQuestions());
EntityState<num,TopicState> prevQuestionsSuccessReducer(EntityState<num,TopicState> prev,PrevTopicQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.addPrevQuestions(action.questionIds));
EntityState<num,TopicState> prevQuestionsFailedReducer(EntityState<num,TopicState> prev,PrevTopicQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.topicId)!.stopLoadingPrevQuestions());

EntityState<num,TopicState> addTopicReducer(EntityState<num,TopicState> prev,AddTopicAction action)
  => prev.appendOne(action.topic);
EntityState<num,TopicState> addTopicsReducer(EntityState<num,TopicState> prev,AddTopicsAction action)
  => prev.appendMany(action.topics);
EntityState<num,TopicState> addTopicsListsReducer(EntityState<num,TopicState> prev,AddTopicsListAction action)
  => prev.appendList(action.lists);

Reducer<EntityState<num,TopicState>> topicEntityStateReducers = combineReducers<EntityState<num,TopicState>>([
  TypedReducer<EntityState<num,TopicState>,NextTopicQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<EntityState<num,TopicState>,NextTopicQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,TopicState>,NextTopicQuestionFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,TopicState>,PrevTopicQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<EntityState<num,TopicState>,PrevTopicQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,TopicState>,PrevTopicQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,TopicState>,AddTopicAction>(addTopicReducer).call,
  TypedReducer<EntityState<num,TopicState>,AddTopicsAction>(addTopicsReducer).call,
  TypedReducer<EntityState<num,TopicState>,AddTopicsListAction>(addTopicsListsReducer).call,
]);