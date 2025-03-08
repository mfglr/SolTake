import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,CommentUserLikeState> addLikesReducer(EntityState<int,CommentUserLikeState> prev,AddCommentUserLikesAction action)
  => prev.appendMany(action.likes);
EntityState<int,CommentUserLikeState> addLikeReducer(EntityState<int,CommentUserLikeState> prev,AddCommentUserLikeAction action)
  => prev.appendOne(action.like);
EntityState<int,CommentUserLikeState> removeLikeReducer(EntityState<int,CommentUserLikeState> prev,RemoveCommentUserLikeAction action)
  => prev.where((e) => e.id.compareTo(action.likeId) != 0);

Reducer<EntityState<int,CommentUserLikeState>> commentUserLikeEntityReducers = combineReducers<EntityState<int,CommentUserLikeState>>([
  TypedReducer<EntityState<int,CommentUserLikeState>,AddCommentUserLikesAction>(addLikesReducer).call,
  TypedReducer<EntityState<int,CommentUserLikeState>,AddCommentUserLikeAction>(addLikeReducer).call,
  TypedReducer<EntityState<int,CommentUserLikeState>,RemoveCommentUserLikeAction>(removeLikeReducer).call,
]);