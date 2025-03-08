import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//get comment likes;
EntityState<int,CommentState> nextLikesReducer(EntityState<int,CommentState> prev,NextCommentLikesAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextLikes());
EntityState<int,CommentState> nextLikesSuccessReducer(EntityState<int,CommentState> prev,NextCommentLikesSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextPageLikes(action.likeIds));
EntityState<int,CommentState> nextLikesFailedReducer(EntityState<int,CommentState> prev, NextCommentLikesFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextLikes());

EntityState<int,CommentState> likeCommentReducer(EntityState<int,CommentState> prev,LikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.like(action.likeId));
EntityState<int,CommentState> dislikeCommentReducer(EntityState<int,CommentState> prev,DislikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.dislike(action.likeId));
EntityState<int,CommentState> addNewLikeReducer(EntityState<int,CommentState> prev,AddNewCommentLikeAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNewLike(action.likeId));

//get comment replies;
EntityState<int,CommentState> nextRepliesReducer(EntityState<int,CommentState> prev,NextCommentRepliesAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextReplies());
EntityState<int,CommentState> nextRepliesSuccessReducer(EntityState<int,CommentState> prev,NextCommentRepliesSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextReplies(action.replyIds));
EntityState<int,CommentState> nextRepliesFailedReducer(EntityState<int,CommentState> prev,NextCommentRepliesFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextReplies());

EntityState<int,CommentState> addReplyReducer(EntityState<int,CommentState> prev,AddCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addReply(action.replyId));
EntityState<int,CommentState> removeReplyReducer(EntityState<int,CommentState> prev,RemoveCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.removeReply(action.replyId));
EntityState<int,CommentState> addNewReplyReducer(EntityState<int,CommentState> prev,AddNewCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNewReply(action.replyId));

EntityState<int,CommentState> changeVisibilityReducer(EntityState<int,CommentState> prev,ChangeRepliesVisibilityAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.changeVisibility(action.visibility));

EntityState<int,CommentState> addCommentReducer(EntityState<int,CommentState> prev,AddCommentAction action)
  => prev.appendOne(action.comment);
EntityState<int,CommentState> removeCommentReducer(EntityState<int,CommentState> prev,RemoveCommentSuccessAction action)
  => prev.where((e) => e.id.compareTo(action.commentId) != 0);
EntityState<int,CommentState> addCommentsReducer(EntityState<int,CommentState> prev,AddCommentsAction action)
  => prev.appendMany(action.comments);

Reducer<EntityState<int,CommentState>> questionCommentEntityStateReducers = combineReducers<EntityState<int,CommentState>>([
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesAction>(nextLikesReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesFailedAction>(nextLikesFailedReducer).call,
  TypedReducer<EntityState<int,CommentState>,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,DislikeCommentSuccessAction>(dislikeCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddNewCommentLikeAction>(addNewLikeReducer).call,

  TypedReducer<EntityState<int,CommentState>,NextCommentRepliesAction>(nextRepliesReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentRepliesSuccessAction>(nextRepliesSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentRepliesFailedAction>(nextRepliesFailedReducer).call,

  TypedReducer<EntityState<int,CommentState>,AddCommentReplyAction>(addReplyReducer).call,
  TypedReducer<EntityState<int,CommentState>,RemoveCommentReplyAction>(removeReplyReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddNewCommentReplyAction>(addNewReplyReducer).call,

  TypedReducer<EntityState<int,CommentState>,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,

  TypedReducer<EntityState<int,CommentState>,AddCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,RemoveCommentSuccessAction>(removeCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddCommentsAction>(addCommentsReducer).call,
]);