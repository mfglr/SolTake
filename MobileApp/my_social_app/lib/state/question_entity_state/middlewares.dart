import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void likeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LikeQuestionAction){
      QuestionService()
        .like(action.questionId)
        .then((_) => store.dispatch(LikeQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionService()
      .dislike(action.questionId)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}