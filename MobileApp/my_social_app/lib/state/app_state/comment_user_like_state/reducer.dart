import 'package:my_social_app/state/app_state/comment_user_like_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,CommentUserLikeState> addLikesReducer(EntityState<num,CommentUserLikeState> prev,AddCommentUserLikesAction action)
  => prev.appendMany(action.likes);
EntityState<num,CommentUserLikeState> addLikeReducer(EntityState<num,CommentUserLikeState> prev,AddCommentUserLikeAction action)
  => prev.appendOne(action.like);
EntityState<num,CommentUserLikeState> removeLikeReducer(EntityState<num,CommentUserLikeState> prev,RemoveCommentUserLikeAction action)
  => prev.where((e) => e.id.compareTo(action.likeId) != 0);

Reducer<EntityState<num,CommentUserLikeState>> commentUserLikeEntityReducers = combineReducers<EntityState<num,CommentUserLikeState>>([
  TypedReducer<EntityState<num,CommentUserLikeState>,AddCommentUserLikesAction>(addLikesReducer).call,
  TypedReducer<EntityState<num,CommentUserLikeState>,AddCommentUserLikeAction>(addLikeReducer).call,
  TypedReducer<EntityState<num,CommentUserLikeState>,RemoveCommentUserLikeAction>(removeLikeReducer).call,
]);