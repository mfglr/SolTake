import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';
import 'package:redux/redux.dart';

TopicEntityState loadTopicsBySubjectIdSuccessReducer(TopicEntityState prev,Action action)
  => action is LoadTopicsBySubjectIdSuccessAction ? prev.loadBySubjcetId(action.subjectId, action.topics) : prev;

TopicEntityState loadTopicsSuccessReducer(TopicEntityState prev,Action action)
  => action is LoadTopicsSuccessAction ? prev.load(action.topics) : prev;

TopicEntityState nextPageOfTopicQuestionsSuccessReducer(TopicEntityState prev,Action action)
  => action is NextPageOfTopicQuestionsSuccessAction ? prev.loadQuestions(action.topicId, action.questionIds) : prev;

Reducer<TopicEntityState> topicEntityStateReducers = combineReducers<TopicEntityState>([
  TypedReducer<TopicEntityState,LoadTopicsBySubjectIdSuccessAction>(loadTopicsBySubjectIdSuccessReducer).call,
  TypedReducer<TopicEntityState,LoadTopicsSuccessAction>(loadTopicsSuccessReducer).call,
  TypedReducer<TopicEntityState,NextPageOfTopicQuestionsSuccessAction>(nextPageOfTopicQuestionsSuccessReducer).call,
]);