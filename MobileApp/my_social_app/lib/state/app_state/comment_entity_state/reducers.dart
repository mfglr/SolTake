import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//get comment likes;
EntityState<num,CommentState> nextLikesReducer(EntityState<num,CommentState> prev,NextCommentLikesAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextLikes());
EntityState<num,CommentState> nextLikesSuccessReducer(EntityState<num,CommentState> prev,NextCommentLikesSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextPageLikes(action.likeIds));
EntityState<num,CommentState> nextLikesFailedReducer(EntityState<num,CommentState> prev, NextCommentLikesFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextLikes());

EntityState<num,CommentState> likeCommentReducer(EntityState<num,CommentState> prev,LikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.like(action.likeId));
EntityState<num,CommentState> dislikeCommentReducer(EntityState<num,CommentState> prev,DislikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.dislike(action.likeId));
EntityState<num,CommentState> addNewLikeReducer(EntityState<num,CommentState> prev,AddNewCommentLikeAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNewLike(action.likeId));

//get comment replies;
EntityState<num,CommentState> nextRepliesReducer(EntityState<num,CommentState> prev,NextCommentRepliesAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextReplies());
EntityState<num,CommentState> nextRepliesSuccessReducer(EntityState<num,CommentState> prev,NextCommentRepliesSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextReplies(action.replyIds));
EntityState<num,CommentState> nextRepliesFailedReducer(EntityState<num,CommentState> prev,NextCommentRepliesFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextReplies());

EntityState<num,CommentState> addReplyReducer(EntityState<num,CommentState> prev,AddCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addReply(action.replyId));
EntityState<num,CommentState> removeReplyReducer(EntityState<num,CommentState> prev,RemoveCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.removeReply(action.replyId));
EntityState<num,CommentState> addNewReplyReducer(EntityState<num,CommentState> prev,AddNewCommentReplyAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNewReply(action.replyId));

EntityState<num,CommentState> changeVisibilityReducer(EntityState<num,CommentState> prev,ChangeRepliesVisibilityAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.changeVisibility(action.visibility));

EntityState<num,CommentState> addCommentReducer(EntityState<num,CommentState> prev,AddCommentAction action)
  => prev.appendOne(action.comment);
EntityState<num,CommentState> removeCommentReducer(EntityState<num,CommentState> prev,RemoveCommentSuccessAction action)
  => prev.where((e) => e.id.compareTo(action.commentId) != 0);
EntityState<num,CommentState> addCommentsReducer(EntityState<num,CommentState> prev,AddCommentsAction action)
  => prev.appendMany(action.comments);

Reducer<EntityState<num,CommentState>> questionCommentEntityStateReducers = combineReducers<EntityState<num,CommentState>>([
  TypedReducer<EntityState<num,CommentState>,NextCommentLikesAction>(nextLikesReducer).call,
  TypedReducer<EntityState<num,CommentState>,NextCommentLikesSuccessAction>(nextLikesSuccessReducer).call,
  TypedReducer<EntityState<num,CommentState>,NextCommentLikesFailedAction>(nextLikesFailedReducer).call,
  TypedReducer<EntityState<num,CommentState>,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<EntityState<num,CommentState>,DislikeCommentSuccessAction>(dislikeCommentReducer).call,
  TypedReducer<EntityState<num,CommentState>,AddNewCommentLikeAction>(addNewLikeReducer).call,

  TypedReducer<EntityState<num,CommentState>,NextCommentRepliesAction>(nextRepliesReducer).call,
  TypedReducer<EntityState<num,CommentState>,NextCommentRepliesSuccessAction>(nextRepliesSuccessReducer).call,
  TypedReducer<EntityState<num,CommentState>,NextCommentRepliesFailedAction>(nextRepliesFailedReducer).call,

  TypedReducer<EntityState<num,CommentState>,AddCommentReplyAction>(addReplyReducer).call,
  TypedReducer<EntityState<num,CommentState>,RemoveCommentReplyAction>(removeReplyReducer).call,
  TypedReducer<EntityState<num,CommentState>,AddNewCommentReplyAction>(addNewReplyReducer).call,

  TypedReducer<EntityState<num,CommentState>,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,

  TypedReducer<EntityState<num,CommentState>,AddCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<num,CommentState>,RemoveCommentSuccessAction>(removeCommentReducer).call,
  TypedReducer<EntityState<num,CommentState>,AddCommentsAction>(addCommentsReducer).call,
]);