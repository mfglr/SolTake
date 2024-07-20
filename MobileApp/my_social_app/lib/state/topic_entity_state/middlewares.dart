import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void nextPageOfTopicQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageOfTopicQuestionsAction){
    final topicState = store.state.topicEntityState.entities[action.topicId]!;
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
            
            store.dispatch(
              AddTopicsListAction(
                lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))
              )
            );
          }
        );
    }
  }
  next(action);
}