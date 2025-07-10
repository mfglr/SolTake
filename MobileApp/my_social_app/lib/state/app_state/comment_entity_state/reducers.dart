import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

// get comment likes;
EntityState<int,CommentState> nextCommentLikesReducer(EntityState<int,CommentState> prev,NextCommentLikesAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextLikes());
EntityState<int,CommentState> nextCommentLikesSuccessReducer(EntityState<int,CommentState> prev,NextCommentLikesSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextPageLikes(action.commentUserLikes));
EntityState<int,CommentState> nextCommentLikesFailedReducer(EntityState<int,CommentState> prev, NextCommentLikesFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextLikes());
// get comment likes;

// like comment
EntityState<int,CommentState> likeCommentSuccessReducer(EntityState<int,CommentState> prev,LikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.like(action.commentUserLike));
EntityState<int,CommentState> dislikeCommentSuccessReducer(EntityState<int,CommentState> prev,DislikeCommentSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.dislike(action.userId));
EntityState<int,CommentState> addNewLikeReducer(EntityState<int,CommentState> prev,AddNewCommentLikeAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNewLike(action.commentUserLike));
// like comment

//get comment replies;
EntityState<int,CommentState> nextChildrenReducer(EntityState<int,CommentState> prev,NextCommentChildrenAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.startLoadingNextReplies());
EntityState<int,CommentState> nextChildrenSuccessReducer(EntityState<int,CommentState> prev,NextCommentChildrenSuccessAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.addNextReplies(action.childIds));
EntityState<int,CommentState> nextChildrenFailedReducer(EntityState<int,CommentState> prev,NextCommentChildrenFailedAction action)
  => prev.updateOne(prev.getValue(action.commentId)!.stopLoadingNextReplies());

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
  
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesAction>(nextCommentLikesReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesSuccessAction>(nextCommentLikesSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentLikesFailedAction>(nextCommentLikesFailedReducer).call,

  TypedReducer<EntityState<int,CommentState>,LikeCommentSuccessAction>(likeCommentSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,DislikeCommentSuccessAction>(dislikeCommentSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddNewCommentLikeAction>(addNewLikeReducer).call,

  TypedReducer<EntityState<int,CommentState>,NextCommentChildrenAction>(nextChildrenReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentChildrenSuccessAction>(nextChildrenSuccessReducer).call,
  TypedReducer<EntityState<int,CommentState>,NextCommentChildrenFailedAction>(nextChildrenFailedReducer).call,
  TypedReducer<EntityState<int,CommentState>,RemoveCommentReplyAction>(removeReplyReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddNewCommentReplyAction>(addNewReplyReducer).call,

  TypedReducer<EntityState<int,CommentState>,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,

  TypedReducer<EntityState<int,CommentState>,AddCommentAction>(addCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,RemoveCommentSuccessAction>(removeCommentReducer).call,
  TypedReducer<EntityState<int,CommentState>,AddCommentsAction>(addCommentsReducer).call,
]);