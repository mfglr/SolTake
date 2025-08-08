import 'package:my_social_app/services/question_user_like_service.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void nextQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionUserLikesAction){
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, selectQuestionUserLikes(store, action.questionId).next)
      .then((likes) => store.dispatch(NextQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(NextQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionUserLikesAction){
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, selectQuestionUserLikes(store, action.questionId).first)
      .then((likes) => store.dispatch(RefreshQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(RefreshQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      }); 
  }
  next(action);
}
void likeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LikeQuestionAction){
    QuestionUserLikeService()
      .like(action.question.id)
      .then((response) => store.dispatch(LikeQuestionSuccessAction(
        question: action.question,
        questionUserLike: response.toQuestionUserLikeState()
      )));
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionUserLikeService()
      .dislike(action.question.id)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(
        question: action.question,
        userId: store.state.login.login!.id
      )));
  }
  next(action);
}