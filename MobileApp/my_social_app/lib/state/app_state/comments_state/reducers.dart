import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/entity_state/pagination_widget/paginable_state.dart';
import 'package:redux/redux.dart';

PaginableState<int,CommentStateId> createCommentSuccessReducer(PaginableState<int,CommentStateId> prev, CreateCommentSuccessAction action)
  => (action.parentId == null || prev.getValue(action.parentId!) == null)
      ? prev.prependOne(action.comment)
      : prev.prependOne(action.comment).updateOne(prev.getValue(action.parentId!)!.increaseNumberOfChildren());
PaginableState<int,CommentStateId> nextCommentsReducer(PaginableState<int,CommentStateId> prev, NextCommentsAction action)
  => prev.appendMany(action.comments);
PaginableState<int,CommentStateId> refreshQuestionCommentsReducer(PaginableState<int,CommentStateId> prev, RefreshQuestionCommentsAction action)
  => prev.where((e) => e.questionId != action.questionId).appendMany(action.comments);
PaginableState<int,CommentStateId> refreshSolutionCommentsReducer(PaginableState<int,CommentStateId> prev, RefreshSolutionCommentsAction action)
  => prev.where((e) => e.solutionId != action.solutionId).appendMany(action.comments);

Reducer<PaginableState<int,CommentStateId>> commentsReducer = combineReducers<PaginableState<int,CommentStateId>>([
  TypedReducer<PaginableState<int,CommentStateId>, CreateCommentSuccessAction>(createCommentSuccessReducer).call,
  TypedReducer<PaginableState<int,CommentStateId>, NextCommentsAction>(nextCommentsReducer).call,
  TypedReducer<PaginableState<int,CommentStateId>, RefreshQuestionCommentsAction>(refreshQuestionCommentsReducer).call,
  TypedReducer<PaginableState<int,CommentStateId>, RefreshSolutionCommentsAction>(refreshSolutionCommentsReducer).call,
]);