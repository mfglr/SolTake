import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:redux/redux.dart';

CommentEntityState nextLikesReducer(CommentEntityState prev,NextCommentLikesAction action)
  => prev.startLoadingNextLikes(action.commentId);
CommentEntityState nextLikesSuccessReducer(CommentEntityState prev,NextCommentLikesSuccessAction action)
  => prev.addNextPageLikes(action.commentId, action.likeIds);
CommentEntityState nextLikesFailedReducer(CommentEntityState prev, NextCommentLikesFailedAction action)
  => prev.stopLoadingNextLikes(action.commentId);

CommentEntityState likeCommentReducer(CommentEntityState prev,LikeCommentSuccessAction action)
  => prev.like(action.commentId, action.likeId);
CommentEntityState dislikeCommentReducer(CommentEntityState prev,DislikeCommentSuccessAction action)
  => prev.dislike(action.commentId,action.likeId);
CommentEntityState addNewLikeReducer(CommentEntityState prev,AddNewCommentLikeAction action)
  => prev.addNewLike(action.commentId, action.likeId);

CommentEntityState nextRepliesReducer(CommentEntityState prev,NextCommentRepliesAction action)
  => prev.startLoadingNextReplies(action.commentId);
CommentEntityState nextRepliesSuccessReducer(CommentEntityState prev,NextCommentRepliesSuccessAction action)
  => prev.addNextReplies(action.commentId,action.replyIds);
CommentEntityState nextRepliesFailedReducer(CommentEntityState prev,NextCommentRepliesFailedAction action)
  => prev.stopLoadingNextReplies(action.commentId);
CommentEntityState addReplyReducer(CommentEntityState prev,AddCommentReplyAction action)
  => prev.addReply(action.commentId, action.replyId);
CommentEntityState removeReplyReducer(CommentEntityState prev,RemoveCommentReplyAction action)
  => prev.removeReply(action.commentId,action.replyId);
CommentEntityState addNewReplyReducer(CommentEntityState prev,AddNewCommentReplyAction action)
  => prev.addNewReply(action.commentId, action.replyId);

CommentEntityState changeVisibilityReducer(CommentEntityState prev,ChangeRepliesVisibilityAction action)
  => prev.changeVisibility(action.commentId, action.visibility);

CommentEntityState addCommentReducer(CommentEntityState prev,AddCommentAction action)
  => CommentEntityState(entities: prev.appendOne(action.comment));
CommentEntityState removeCommentReducer(CommentEntityState prev,RemoveCommentSuccessAction action)
  => CommentEntityState(entities: prev.removeOne(action.commentId));
CommentEntityState addCommentsReducer(CommentEntityState prev,AddCommentsAction action)
  => CommentEntityState(entities: prev.appendMany(action.comments));

Reducer<CommentEntityState> questionCommentEntityStateReducers = combineReducers<CommentEntityState>([
  TypedReducer<CommentEntityState,NextCommentLikesAction>(nextLikesReducer).call,
  TypedReducer<CommentEntityState,NextCommentLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<CommentEntityState,NextCommentLikesFailedAction>(nextLikesFailedReducer).call,
  TypedReducer<CommentEntityState,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<CommentEntityState,DislikeCommentSuccessAction>(dislikeCommentReducer).call,
  TypedReducer<CommentEntityState,AddNewCommentLikeAction>(addNewLikeReducer).call,

  TypedReducer<CommentEntityState,NextCommentRepliesAction>(nextRepliesReducer).call,
  TypedReducer<CommentEntityState,NextCommentRepliesSuccessAction>(nextRepliesSuccessReducer).call,
  TypedReducer<CommentEntityState,NextCommentRepliesFailedAction>(nextRepliesFailedReducer).call,

  TypedReducer<CommentEntityState,AddCommentReplyAction>(addReplyReducer).call,
  TypedReducer<CommentEntityState,RemoveCommentReplyAction>(removeReplyReducer).call,
  TypedReducer<CommentEntityState,AddNewCommentReplyAction>(addNewReplyReducer).call,

  TypedReducer<CommentEntityState,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,

  TypedReducer<CommentEntityState,AddCommentAction>(addCommentReducer).call,
  TypedReducer<CommentEntityState,RemoveCommentSuccessAction>(removeCommentReducer).call,
  TypedReducer<CommentEntityState,AddCommentsAction>(addCommentsReducer).call,
]);