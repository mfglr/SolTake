import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/comment_entity_state/comment_entity_state.dart';
import 'package:redux/redux.dart';

CommentEntityState changeVisibilityReducer(CommentEntityState prev,ChangeRepliesVisibilityAction action)
  => prev.changeVisibility(action.commentId, action.visibility);

CommentEntityState addCommentReducer(CommentEntityState prev,AddCommentAction action)
  => CommentEntityState(entities: prev.appendOne(action.comment));
CommentEntityState addCommentsReducer(CommentEntityState prev,AddCommentsAction action)
  => CommentEntityState(entities: prev.appendMany(action.comments));
CommentEntityState likeCommentReducer(CommentEntityState prev,LikeCommentSuccessAction action)
  => prev.like(action.questionCommentId, action.userId);
CommentEntityState dislikeCommentReducer(CommentEntityState prev,DislikeCommentSuccessAction action)
  => prev.dislike(action.questionCommentId,action.userId);
  
CommentEntityState addReplyReducer(CommentEntityState prev,AddCommentReplyAction action)
  => prev.addReply(action.commentId, action.replyId);
CommentEntityState nextPageRepliesSuccessReducer(CommentEntityState prev,NextPageRepliesSuccessAction action)
  => prev.nextPageReplies(action.commentId,action.replyIds);

Reducer<CommentEntityState> questionCommentEntityStateReducers = combineReducers<CommentEntityState>([
  TypedReducer<CommentEntityState,ChangeRepliesVisibilityAction>(changeVisibilityReducer).call,
  TypedReducer<CommentEntityState,AddCommentAction>(addCommentReducer).call,
  TypedReducer<CommentEntityState,AddCommentsAction>(addCommentsReducer).call,
  TypedReducer<CommentEntityState,LikeCommentSuccessAction>(likeCommentReducer).call,
  TypedReducer<CommentEntityState,DislikeCommentSuccessAction>(dislikeCommentReducer).call,
  TypedReducer<CommentEntityState,AddCommentReplyAction>(addReplyReducer).call,
  TypedReducer<CommentEntityState,NextPageRepliesSuccessAction>(nextPageRepliesSuccessReducer).call,
]);