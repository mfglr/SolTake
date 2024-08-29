import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_entity_state.dart';
import 'package:redux/redux.dart';

CommentUserLikeEntityState addLikesReducer(CommentUserLikeEntityState prev,AddCommentUserLikesAction action)
  => prev.addLikes(action.likes);
CommentUserLikeEntityState addLikeReducer(CommentUserLikeEntityState prev,AddCommentUserLikeAction action)
  => prev.addLike(action.like);
CommentUserLikeEntityState removeLikeReducer(CommentUserLikeEntityState prev,RemoveCommentUserLikeAction action)
  => prev.removeLike(action.likeId);

Reducer<CommentUserLikeEntityState> commentUserLikeEntityReducers = combineReducers<CommentUserLikeEntityState>([
  TypedReducer<CommentUserLikeEntityState,AddCommentUserLikesAction>(addLikesReducer).call,
  TypedReducer<CommentUserLikeEntityState,AddCommentUserLikeAction>(addLikeReducer).call,
  TypedReducer<CommentUserLikeEntityState,RemoveCommentUserLikeAction>(removeLikeReducer).call,
]);