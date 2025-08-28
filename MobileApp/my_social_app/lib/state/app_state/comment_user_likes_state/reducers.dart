import 'package:my_social_app/state/app_state/comment_user_likes_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/comment_user_likes_state.dart';
import 'package:redux/redux.dart';

CommentUserLikesState likeCommentSuccessReducer(CommentUserLikesState prev, LikeCommentSuccessAction action) =>
  prev.like(action.comment, action.commentUserLike);
CommentUserLikesState dislikeCommentSuccessReducer(CommentUserLikesState prev, DislikeCommentSuccessAction action) =>
  prev.dislike(action.comment, action.userId);

CommentUserLikesState nextCommentUserLikesReducer(CommentUserLikesState prev, NextCommentUserLikesAction action) =>
  prev.startNext(action.commentId);
CommentUserLikesState nextCommentUserLikesSuccessReducer(CommentUserLikesState prev, NextCommentUserLikesSuccessAction action) =>
  prev.addNext(action.commentId, action.commentUserLikes);
CommentUserLikesState nextCommentUserLikesFailedReducer(CommentUserLikesState prev, NextCommentUserLikesFailedAction action) =>
  prev.stopNext(action.commentId);

CommentUserLikesState refreshCommentUserLikesReducer(CommentUserLikesState prev, RefreshCommentUserLikesAction action) =>
  prev.startNext(action.commentId);
CommentUserLikesState refreshCommentUserLikesSuccessReducer(CommentUserLikesState prev, RefreshCommentUserLikesSuccessAction action) =>
  prev.refresh(action.commentId, action.commentUserLikes);
CommentUserLikesState refreshCommentUserLikesFailedReducer(CommentUserLikesState prev, RefreshCommentUserLikesFailedAction action) =>
  prev.stopNext(action.commentId);

Reducer<CommentUserLikesState> commentUserLikesReducer = combineReducers<CommentUserLikesState>([
  TypedReducer<CommentUserLikesState,LikeCommentSuccessAction>(likeCommentSuccessReducer).call,
  TypedReducer<CommentUserLikesState,DislikeCommentSuccessAction>(dislikeCommentSuccessReducer).call,

  TypedReducer<CommentUserLikesState,NextCommentUserLikesAction>(nextCommentUserLikesReducer).call,
  TypedReducer<CommentUserLikesState,NextCommentUserLikesSuccessAction>(nextCommentUserLikesSuccessReducer).call,
  TypedReducer<CommentUserLikesState,NextCommentUserLikesFailedAction>(nextCommentUserLikesFailedReducer).call,

  TypedReducer<CommentUserLikesState,RefreshCommentUserLikesAction>(refreshCommentUserLikesReducer).call,
  TypedReducer<CommentUserLikesState,RefreshCommentUserLikesSuccessAction>(refreshCommentUserLikesSuccessReducer).call,
  TypedReducer<CommentUserLikesState,RefreshCommentUserLikesFailedAction>(refreshCommentUserLikesFailedReducer).call,
]);

