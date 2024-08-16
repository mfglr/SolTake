import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_entity_state.dart';
import 'package:redux/redux.dart';

CommentEntityState getNextPageLikesReducer(CommentEntityState prev,GetNextPageCommentLikesAction action)
  => prev.getNextPageLikes(action.commentId);
CommentEntityState addNextPageLikesReducer(CommentEntityState prev,AddNextPageCommentLikesAction action)
  => prev.addNextPageLikes(action.commentId, action.userIds);
CommentEntityState likeCommentReducer(CommentEntityState prev,LikeCommentSuccessAction action)
  => prev.like(action.questionCommentId, action.userId);
CommentEntityState dislikeCommentReducer(CommentEntityState prev,DislikeCommentSuccessAction action)
  => prev.dislike(action.questionCommentId,action.userId);

CommentEntityState getNextPageCommentRepliesReducer(CommentEntityState prev,GetNextPageCommentRepliesAction action)
  => prev.nextPageReplies(action.commentId);
CommentEntityState addNextPageCommentRepliesReducer(CommentEntityState prev,AddNextPageCommentRepliesAction action)
  => prev.addNextPageReplies(action.commentId,action.replyIds);
CommentEntityState addReplyReducer(CommentEntityState prev,AddCommentReplyAction action)
  => prev.addReply(action.commentId, action.replyId);

CommentEntityState changeVisibilityReducer(CommentEntityState prev,ChangeRepliesVisibilityAction action)
  => prev.changeVisibility(action.commentId, action.visibility);
CommentEntityState addCommentReducer(CommentEntityState prev,AddCommentAction action)
  => CommentEntityState(entities: prev.appendOne(action.comment));
CommentEntityState addCommentsReducer(CommentEntityState prev,AddCommentsAction action)
  => CommentEntityState(entities: prev.appendMany(action.comments));

Reducer<CommentEntityState> questionCommentEntityStateReducers = combineReducers<CommentEntityState>([
  TypedReducer<CommentEntityState,GetNextPageCommentLikesAction>(getNextPageLikesReducer).call,
  TypedReducer<CommentEntityState,AddNextPageCommentLikesAction>(addNextPageLikesReducer).call,
  TypedReducer<CommentEntityState,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<CommentEntityState,DislikeCommentSuccessAction>(dislikeCommentReducer).call,

  TypedReducer<CommentEntityState,GetNextPageCommentRepliesAction>(getNextPageCommentRepliesReducer).call,
  TypedReducer<CommentEntityState,AddNextPageCommentRepliesAction>(addNextPageCommentRepliesReducer).call,
  TypedReducer<CommentEntityState,AddCommentReplyAction>(addReplyReducer).call,

  TypedReducer<CommentEntityState,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,
  TypedReducer<CommentEntityState,AddCommentAction>(addCommentReducer).call,
  TypedReducer<CommentEntityState,AddCommentsAction>(addCommentsReducer).call,
]);