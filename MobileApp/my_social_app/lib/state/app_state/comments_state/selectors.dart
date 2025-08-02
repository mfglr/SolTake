import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, CommentState> selectQuestionCommentsFromState(CommentsState state, int questionId) =>
  state.questionComments[questionId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectQuestionComments(Store<AppState> store, int questionId) =>
  selectQuestionCommentsFromState(store.state.comments, questionId);

Pagination<int, CommentState> selectSolutionCommentsFromState(CommentsState state, int solutionId) =>
  state.solutionComments[solutionId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectSolutionComments(Store<AppState> store, int solutionId) =>
  selectSolutionCommentsFromState(store.state.comments, solutionId);
CommentState? selectQuestionComment(Store<AppState> store, int questionId, int commentId) =>
  store.state.comments.questionComments[questionId]?.get((e) => e.id == commentId);

Pagination<int,CommentState> selectChildrenFromCommentsState(CommentsState state, int commentId) =>
  state.children[commentId] ?? Pagination.init(commentsPerPage, false);
Pagination<int, CommentState> selectChildren(Store<AppState> store, int commentId) =>
  selectChildrenFromCommentsState(store.state.comments, commentId);
CommentState? selectSolutionComment(Store<AppState> store, int solutoinId, int commentId) =>
  store.state.comments.solutionComments[solutoinId]?.get((e) => e.id == commentId);

int selectNumberOfNotDisplayedReplies(Store<AppState> store, bool isVisible, CommentState comment) =>
  comment.numberOfChildren - (isVisible ? store.state.comments.children[comment.id]?.values.length ?? 0 : 0);


  
