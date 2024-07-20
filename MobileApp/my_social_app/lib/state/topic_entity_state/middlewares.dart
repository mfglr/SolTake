import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadTopicsBySubjectIdMiddelware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadTopicsBySubjectIdAction){
    final subjectId = store.state.createQuestionState.subjectId!;
    if(!store.state.topicEntityState.isLoaded(subjectId)){
      TopicService()
        .getBySubjectId(subjectId)
        .then(
          (topics) => store.dispatch(
            LoadTopicsBySubjectIdSuccessAction(
              subjectId: subjectId,
              topics: topics.map((e) => e.toTopicState()).toList()
            )
          )
        );
    }
  }
  next(action);
}

void nextPageOfTopicQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfTopicQuestionsAction){
    final topicState = store.state.topicEntityState.topics[action.topicId]!;
    if(!topicState.questions.isLast){
      QuestionService()
        .getByTopicId(action.topicId)
        .then(
          (questions){
            store.dispatch(
              AddQuestionsAction(
                questions: questions.map((e) => e.toQuestionState()).toList()
              )
            );
            store.dispatch(
              NextPageOfTopicQuestionsSuccessAction(
                topicId: action.topicId,
                questionIds: questions.map((x) => x.id).toList()
              )
            );
            for(final q in questions){
              store.dispatch(LoadTopicsSuccessAction(topics: q.topics.map((e) => e.toTopicState())));
            }
          }
        );
    }
  }
  next(action);
}