import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:redux/redux.dart';

CommentsState createCommentReducer(CommentsState prev, CreateCommentsSuccessAction action) =>
  prev.create(action.comment);

//question comments
CommentsState nextQuestionCommentsReducer(CommentsState prev, NextQuestionCommentsAction action) =>
  prev.startNextLoadingQuestionComments(action.questionId);
CommentsState nextQuestionCommentsSuccessReducer(CommentsState prev, NextQuestionCommentsSuccessAction action) =>
  prev.addNextPageQuestionComments(action.questionId,action.comments);
CommentsState nextQuestionCommentsFailedReducer(CommentsState prev, NextQuestionCommentsFailedAction action) =>
  prev.stopLoadingNextQuestionComments(action.questionId);

CommentsState refreshQuestionCommentsReducer(CommentsState prev, RefreshQuestionCommentsAction action) =>
  prev.startNextLoadingQuestionComments(action.questionId);
CommentsState refreshQuestionCommentsSuccessReducer(CommentsState prev, RefreshQuestionCommentsSuccessAction action) =>
  prev.refreshPageQuestionComments(action.questionId,action.comments);
CommentsState refreshQuestionCommentsFailedReducer(CommentsState prev, RefreshQuestionCommentsFailedAction action) =>
  prev.stopLoadingNextQuestionComments(action.questionId);
//question comments

//solution comments
CommentsState nextSolutionCommentsReducer(CommentsState prev, NextSolutionCommentsAction action) =>
  prev.startNextLoadingSolutionComments(action.solutionId);
CommentsState nextSolutionCommentsSuccessReducer(CommentsState prev, NextSolutionCommentsSuccessAction action) =>
  prev.addNextPageSolutionComments(action.solutionId,action.comments);
CommentsState nextSolutionCommentsFailedReducer(CommentsState prev, NextSolutionCommentsFailedAction action) =>
  prev.stopLoadingNextSolutionComments(action.solutionId);

CommentsState refreshSolutionCommentsReducer(CommentsState prev, RefreshSolutionCommentsAction action) =>
  prev.startNextLoadingSolutionComments(action.solutionId);
CommentsState refreshSolutionCommentsSuccessReducer(CommentsState prev, RefreshSolutionCommentsSuccessAction action) =>
  prev.refreshPageSolutionComments(action.solutionId,action.comments);
CommentsState refreshSolutionCommentsFailedReducer(CommentsState prev, RefreshSolutionCommentsFailedAction action) =>
  prev.stopLoadingNextSolutionComments(action.solutionId);
//solution comments

Reducer<CommentsState> commentsReducer = combineReducers<CommentsState>([
  TypedReducer<CommentsState, CreateCommentsSuccessAction>(createCommentReducer).call,

  //question comments
  TypedReducer<CommentsState, NextQuestionCommentsAction>(nextQuestionCommentsReducer).call,
  TypedReducer<CommentsState, NextQuestionCommentsSuccessAction>(nextQuestionCommentsSuccessReducer).call,
  TypedReducer<CommentsState, NextQuestionCommentsFailedAction>(nextQuestionCommentsFailedReducer).call,

  TypedReducer<CommentsState, RefreshQuestionCommentsAction>(refreshQuestionCommentsReducer).call,
  TypedReducer<CommentsState, RefreshQuestionCommentsSuccessAction>(refreshQuestionCommentsSuccessReducer).call,
  TypedReducer<CommentsState, RefreshQuestionCommentsFailedAction>(refreshQuestionCommentsFailedReducer).call,
  //question comments

  //solution comments
  TypedReducer<CommentsState, NextSolutionCommentsAction>(nextSolutionCommentsReducer).call,
  TypedReducer<CommentsState, NextSolutionCommentsSuccessAction>(nextSolutionCommentsSuccessReducer).call,
  TypedReducer<CommentsState, NextSolutionCommentsFailedAction>(nextSolutionCommentsFailedReducer).call,

  TypedReducer<CommentsState, RefreshSolutionCommentsAction>(refreshSolutionCommentsReducer).call,
  TypedReducer<CommentsState, RefreshSolutionCommentsSuccessAction>(refreshSolutionCommentsSuccessReducer).call,
  TypedReducer<CommentsState, RefreshSolutionCommentsFailedAction>(refreshSolutionCommentsFailedReducer).call,
  //solution comments
]);

