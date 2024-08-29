import 'package:my_social_app/state/app_state/question_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_like_state/question_user_like_entity_state.dart';
import 'package:redux/redux.dart';

QuestionUserLikeEntityState addLikesReducer(QuestionUserLikeEntityState prev,AddQuestionUserLikesAction action)
  => prev.addLikes(action.likes);
QuestionUserLikeEntityState addLikeReducer(QuestionUserLikeEntityState prev,AddQuestionUserLikeAction action)
  => prev.addLike(action.like);
QuestionUserLikeEntityState removeLikeReducer(QuestionUserLikeEntityState prev,RemoveQuestionUserLikeAction action)
  => prev.removeLike(action.likeId);

Reducer<QuestionUserLikeEntityState> questionUserLikeEntityReducers = combineReducers<QuestionUserLikeEntityState>([
  TypedReducer<QuestionUserLikeEntityState,AddQuestionUserLikesAction>(addLikesReducer).call,
  TypedReducer<QuestionUserLikeEntityState,AddQuestionUserLikeAction>(addLikeReducer).call,
  TypedReducer<QuestionUserLikeEntityState,RemoveQuestionUserLikeAction>(removeLikeReducer).call,
]);