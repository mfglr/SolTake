import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:redux/redux.dart';

CommentEntityState getNextPageLikesReducer(CommentEntityState prev,GetNextPageCommentLikesAction action)
  => prev.getNextPageLikes(action.commentId);
CommentEntityState addNextPageLikesReducer(CommentEntityState prev,AddNextPageCommentLikesAction action)
  => prev.addNextPageLikes(action.commentId, action.likeIds);
CommentEntityState likeCommentReducer(CommentEntityState prev,LikeCommentSuccessAction action)
  => prev.like(action.commentId, action.likeId);
CommentEntityState dislikeCommentReducer(CommentEntityState prev,DislikeCommentSuccessAction action)
  => prev.dislike(action.commentId,action.likeId);
CommentEntityState addNewLikeReducer(CommentEntityState prev,AddNewCommentLikeAction action)
  => prev.addNewLike(action.commentId, action.likeId);

CommentEntityState getNextPageRepliesReducer(CommentEntityState prev,GetNextPageCommentRepliesAction action)
  => prev.getNextPageReplies(action.commentId);
CommentEntityState addNextPageRepliesReducer(CommentEntityState prev,AddPrevPageCommentRepliesAction action)
  => prev.addNextPageReplies(action.commentId,action.replyIds);
CommentEntityState addReplyReducer(CommentEntityState prev,AddCommentReplyAction action)
  => prev.addReply(action.commentId, action.replyId);
CommentEntityState removeReplyReducer(CommentEntityState prev,RemoveCommentReplyAction action)
  => prev.removeReply(action.commentId,action.replyId);

CommentEntityState changeVisibilityReducer(CommentEntityState prev,ChangeRepliesVisibilityAction action)
  => prev.changeVisibility(action.commentId, action.visibility);

CommentEntityState addCommentReducer(CommentEntityState prev,AddCommentAction action)
  => CommentEntityState(entities: prev.appendOne(action.comment));
CommentEntityState removeCommentReducer(CommentEntityState prev,RemoveCommentSuccessAction action)
  => CommentEntityState(entities: prev.removeOne(action.commentId));
CommentEntityState addCommentsReducer(CommentEntityState prev,AddCommentsAction action)
  => CommentEntityState(entities: prev.appendMany(action.comments));

Reducer<CommentEntityState> questionCommentEntityStateReducers = combineReducers<CommentEntityState>([
  TypedReducer<CommentEntityState,GetNextPageCommentLikesAction>(getNextPageLikesReducer).call,
  TypedReducer<CommentEntityState,AddNextPageCommentLikesAction>(addNextPageLikesReducer).call,
  TypedReducer<CommentEntityState,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<CommentEntityState,DislikeCommentSuccessAction>(dislikeCommentReducer).call,
  TypedReducer<CommentEntityState,AddNewCommentLikeAction>(addNewLikeReducer).call,

  TypedReducer<CommentEntityState,GetNextPageCommentRepliesAction>(getNextPageRepliesReducer).call,
  TypedReducer<CommentEntityState,AddPrevPageCommentRepliesAction>(addNextPageRepliesReducer).call,
  TypedReducer<CommentEntityState,AddCommentReplyAction>(addReplyReducer).call,
  TypedReducer<CommentEntityState,RemoveCommentReplyAction>(removeReplyReducer).call,

  TypedReducer<CommentEntityState,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,

  TypedReducer<CommentEntityState,AddCommentAction>(addCommentReducer).call,
  TypedReducer<CommentEntityState,RemoveCommentSuccessAction>(removeCommentReducer).call,
  TypedReducer<CommentEntityState,AddCommentsAction>(addCommentsReducer).call,
]);