import 'package:my_social_app/state/comment_user_likes_state/actions.dart';
import 'package:my_social_app/state/comments_state/actions.dart';
import 'package:my_social_app/state/comments_state/comments_state.dart';
import 'package:redux/redux.dart';

CommentsState createCommentSuccessReducer(CommentsState prev, CreateCommentSuccessAction action) =>
  prev.create(action.comment);
CommentsState deleteCommentSuccessReducer(CommentsState prev, DeleteCommentSuccessAction action) =>
  prev.delete(action.comment);
CommentsState likeCommentSuccessReducer(CommentsState prev, LikeCommentSuccessAction action) =>
  prev.like(action.comment);
CommentsState dislikeCommentSuccessReducer(CommentsState prev, DislikeCommentSuccessAction action) =>
  prev.dislike(action.comment);

//question comments
CommentsState nextQuestionCommentsReducer(CommentsState prev, NextQuestionCommentsAction action) =>
  prev.startNextQuestionComments(action.questionId);
CommentsState nextQuestionCommentsSuccessReducer(CommentsState prev, NextQuestionCommentsSuccessAction action) =>
  prev.addNextQuestionComments(action.questionId,action.comments);
CommentsState nextQuestionCommentsFailedReducer(CommentsState prev, NextQuestionCommentsFailedAction action) =>
  prev.stopNextQuestionComments(action.questionId);

CommentsState refreshQuestionCommentsReducer(CommentsState prev, RefreshQuestionCommentsAction action) =>
  prev.startNextQuestionComments(action.questionId);
CommentsState refreshQuestionCommentsSuccessReducer(CommentsState prev, RefreshQuestionCommentsSuccessAction action) =>
  prev.refresQuestionComments(action.questionId,action.comments);
CommentsState refreshQuestionCommentsFailedReducer(CommentsState prev, RefreshQuestionCommentsFailedAction action) =>
  prev.stopNextQuestionComments(action.questionId);
//question comments

//solution comments
CommentsState nextSolutionCommentsReducer(CommentsState prev, NextSolutionCommentsAction action) =>
  prev.startNextSolutionComments(action.solutionId);
CommentsState nextSolutionCommentsSuccessReducer(CommentsState prev, NextSolutionCommentsSuccessAction action) =>
  prev.addNextSolutionComments(action.solutionId,action.comments);
CommentsState nextSolutionCommentsFailedReducer(CommentsState prev, NextSolutionCommentsFailedAction action) =>
  prev.stopNextSolutionComments(action.solutionId);

CommentsState refreshSolutionCommentsReducer(CommentsState prev, RefreshSolutionCommentsAction action) =>
  prev.startNextSolutionComments(action.solutionId);
CommentsState refreshSolutionCommentsSuccessReducer(CommentsState prev, RefreshSolutionCommentsSuccessAction action) =>
  prev.refresSolutionComments(action.solutionId,action.comments);
CommentsState refreshSolutionCommentsFailedReducer(CommentsState prev, RefreshSolutionCommentsFailedAction action) =>
  prev.stopNextSolutionComments(action.solutionId);
//solution comments

//comment comments
CommentsState nextCommentCommentsReducer(CommentsState prev, NextCommentCommentsAction action) =>
  prev.startNextCommentComments(action.commentId);
CommentsState nextCommentCommentsSuccessReducer(CommentsState prev, NextCommentCommentsSuccessAction action) =>
  prev.addNextCommentComments(action.commentId,action.comments);
CommentsState nextCommentCommentsFailedReducer(CommentsState prev, NextCommentCommentsFailedAction action) =>
  prev.stopNextCommentComments(action.commentId);

CommentsState refreshCommentCommentsReducer(CommentsState prev, RefreshCommentCommentsAction action) =>
  prev.startNextCommentComments(action.commentId);
CommentsState refreshCommentCommentsSuccessReducer(CommentsState prev, RefreshCommentCommentsSuccessAction action) =>
  prev.refresCommentComments(action.commentId,action.comments);
CommentsState refreshCommentCommentsFailedReducer(CommentsState prev, RefreshCommentCommentsFailedAction action) =>
  prev.stopNextCommentComments(action.commentId);
//comment comments


Reducer<CommentsState> commentsReducer = combineReducers<CommentsState>([
  TypedReducer<CommentsState, CreateCommentSuccessAction>(createCommentSuccessReducer).call,
  TypedReducer<CommentsState, DeleteCommentSuccessAction>(deleteCommentSuccessReducer).call,

  TypedReducer<CommentsState, LikeCommentSuccessAction>(likeCommentSuccessReducer).call,
  TypedReducer<CommentsState, DislikeCommentSuccessAction>(dislikeCommentSuccessReducer).call,

  //question comments
  TypedReducer<CommentsState,NextQuestionCommentsAction>(nextQuestionCommentsReducer).call,
  TypedReducer<CommentsState,NextQuestionCommentsSuccessAction>(nextQuestionCommentsSuccessReducer).call,
  TypedReducer<CommentsState,NextQuestionCommentsFailedAction>(nextQuestionCommentsFailedReducer).call,

  TypedReducer<CommentsState,RefreshQuestionCommentsAction>(refreshQuestionCommentsReducer).call,
  TypedReducer<CommentsState,RefreshQuestionCommentsSuccessAction>(refreshQuestionCommentsSuccessReducer).call,
  TypedReducer<CommentsState,RefreshQuestionCommentsFailedAction>(refreshQuestionCommentsFailedReducer).call,
  //question comments

  //solution comments
  TypedReducer<CommentsState,NextSolutionCommentsAction>(nextSolutionCommentsReducer).call,
  TypedReducer<CommentsState,NextSolutionCommentsSuccessAction>(nextSolutionCommentsSuccessReducer).call,
  TypedReducer<CommentsState,NextSolutionCommentsFailedAction>(nextSolutionCommentsFailedReducer).call,

  TypedReducer<CommentsState,RefreshSolutionCommentsAction>(refreshSolutionCommentsReducer).call,
  TypedReducer<CommentsState,RefreshSolutionCommentsSuccessAction>(refreshSolutionCommentsSuccessReducer).call,
  TypedReducer<CommentsState,RefreshSolutionCommentsFailedAction>(refreshSolutionCommentsFailedReducer).call,
  //solution comments

  //comment comments
  TypedReducer<CommentsState,NextCommentCommentsAction>(nextCommentCommentsReducer).call,
  TypedReducer<CommentsState,NextCommentCommentsSuccessAction>(nextCommentCommentsSuccessReducer).call,
  TypedReducer<CommentsState,NextCommentCommentsFailedAction>(nextCommentCommentsFailedReducer).call,

  TypedReducer<CommentsState,RefreshCommentCommentsAction>(refreshCommentCommentsReducer).call,
  TypedReducer<CommentsState,RefreshCommentCommentsSuccessAction>(refreshCommentCommentsSuccessReducer).call,
  TypedReducer<CommentsState,RefreshCommentCommentsFailedAction>(refreshCommentCommentsFailedReducer).call,
  //comment comments
]);