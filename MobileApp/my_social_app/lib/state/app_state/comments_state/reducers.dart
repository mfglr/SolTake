import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:redux/redux.dart';

CommentsState createCommentSuccessReducer(CommentsState prev, CreateCommentsSuccessAction action) =>
  prev.create(action.parent, action.comment);
CommentsState deleteCommentSuccessReducer(CommentsState prev, DeleteCommentSuccessAction action) =>
  prev.delete(action.comment);

//question comments
CommentsState nextQuestionCommentsReducer(CommentsState prev, NextQuestionCommentsAction action) =>
  prev.startLoadingNextQuestionComments(action.questionId);
CommentsState nextQuestionCommentsSuccessReducer(CommentsState prev, NextQuestionCommentsSuccessAction action) =>
  prev.addNextPageQuestionComments(action.questionId,action.comments);
CommentsState nextQuestionCommentsFailedReducer(CommentsState prev, NextQuestionCommentsFailedAction action) =>
  prev.stopLoadingNextQuestionComments(action.questionId);

CommentsState refreshQuestionCommentsReducer(CommentsState prev, RefreshQuestionCommentsAction action) =>
  prev.startLoadingNextQuestionComments(action.questionId);
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

//children
CommentsState nextCommentChildrenReducer(CommentsState prev, NextCommentChildrenAction action) =>
  prev.startLoadingNextChildren(action.parentId);
CommentsState nextCommentChildrenSuccessReducer(CommentsState prev, NextCommentChildrenSuccessAction action) =>
  prev.addNextPageChildren(action.parentId, action.comments);
CommentsState nextCommentChildrenFailedReducer(CommentsState prev, NextCommentChildrenFailedAction action) =>
  prev.startLoadingNextChildren(action.parentId);

CommentsState refreshCommentChildrenReducer(CommentsState prev, RefreshCommentChildrenAction action) =>
  prev.startLoadingNextChildren(action.parentId);
CommentsState refreshCommentChildrenSuccessReducer(CommentsState prev, RefreshCommentChildrenSuccessAction action) =>
  prev.refreshPageChildren(action.parentId, action.comments);
CommentsState refreshCommentChildrenFailedReducer(CommentsState prev, RefreshCommentChildrenFailedAction action) =>
  prev.startLoadingNextChildren(action.parentId);
//children

//comment user likes
CommentsState nextCommentUserLikesReducer(CommentsState prev, NextCommentUserLikesAction action) =>
  prev.startLoadingNextCommentUserLikes(action.commentId);
CommentsState nextCommentUserLikesSuccessReducer(CommentsState prev, NextCommentUserLikesSuccessAction action) =>
  prev.addNextCommentUserLikes(action.commentId,action.commentUserLikes);
CommentsState nextCommentUserLikesFailedReducer(CommentsState prev, NextCommentUserLikesFailedAction action) =>
  prev.stopLoadingNextCommentUserLikes(action.commentId);

CommentsState refreshCommentUserLikesReducer(CommentsState prev, RefreshCommentUserLikesAction action) =>
  prev.startLoadingNextCommentUserLikes(action.commentId);
CommentsState refreshCommentUserLikesSuccessReducer(CommentsState prev, RefreshCommentUserLikesSuccessAction action) =>
  prev.refreshCommentUserLikes(action.commentId,action.commentUserLikes);
CommentsState refreshCommentUserLikesFailedReducer(CommentsState prev, RefreshCommentUserLikesFailedAction action) =>
  prev.stopLoadingNextCommentUserLikes(action.commentId);

CommentsState likeCommentSuccessReducer(CommentsState prev, LikeCommentSuccessAction action) =>
  prev.like(action.comment, action.commentUserLike);
CommentsState dislikeCommentSuccessReducer(CommentsState prev, DislikeCommentSuccessAction action) =>
  prev.dislike(action.comment, action.userId);
//comment user likes

Reducer<CommentsState> commentsReducer = combineReducers<CommentsState>([
  TypedReducer<CommentsState, CreateCommentsSuccessAction>(createCommentSuccessReducer).call,
  TypedReducer<CommentsState, DeleteCommentSuccessAction>(deleteCommentSuccessReducer).call,

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

  //children
  TypedReducer<CommentsState, NextCommentChildrenAction>(nextCommentChildrenReducer).call,
  TypedReducer<CommentsState, NextCommentChildrenSuccessAction>(nextCommentChildrenSuccessReducer).call,
  TypedReducer<CommentsState, NextCommentChildrenFailedAction>(nextCommentChildrenFailedReducer).call,

  TypedReducer<CommentsState, RefreshCommentChildrenAction>(refreshCommentChildrenReducer).call,
  TypedReducer<CommentsState, RefreshCommentChildrenSuccessAction>(refreshCommentChildrenSuccessReducer).call,
  TypedReducer<CommentsState, RefreshCommentChildrenFailedAction>(refreshCommentChildrenFailedReducer).call,
  //children

  //comment user likes
  TypedReducer<CommentsState, NextCommentUserLikesAction>(nextCommentUserLikesReducer).call,
  TypedReducer<CommentsState, NextCommentUserLikesSuccessAction>(nextCommentUserLikesSuccessReducer).call,
  TypedReducer<CommentsState, NextCommentUserLikesFailedAction>(nextCommentUserLikesFailedReducer).call,
  
  TypedReducer<CommentsState, RefreshCommentUserLikesAction>(refreshCommentUserLikesReducer).call,
  TypedReducer<CommentsState, RefreshCommentUserLikesSuccessAction>(refreshCommentUserLikesSuccessReducer).call,
  TypedReducer<CommentsState, NextCommentUserLikesFailedAction>(nextCommentUserLikesFailedReducer).call,

  TypedReducer<CommentsState, LikeCommentSuccessAction>(likeCommentSuccessReducer).call,
  TypedReducer<CommentsState, DislikeCommentSuccessAction>(dislikeCommentSuccessReducer).call,
  //comment user likes
]);

