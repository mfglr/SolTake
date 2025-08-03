import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, CommentState> selectQuestionCommentsFromState(CommentsState state, int questionId) =>
  state.questionComments[questionId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectQuestionComments(Store<AppState> store, int questionId) =>
  selectQuestionCommentsFromState(store.state.comments, questionId);
CommentState? selectQuestionComment(Store<AppState> store, int questionId, int commentId) =>
  store.state.comments.questionComments[questionId]?[commentId];

Pagination<int, CommentState> selectSolutionCommentsFromState(CommentsState state, int solutionId) =>
  state.solutionComments[solutionId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectSolutionComments(Store<AppState> store, int solutionId) =>
  selectSolutionCommentsFromState(store.state.comments, solutionId);
CommentState? selectSolutionComment(Store<AppState> store, int solutionId, int commentId) =>
  store.state.comments.solutionComments[solutionId]?[commentId];

Pagination<int,CommentState> selectChildrenFromCommentsState(CommentsState state, int parentId) =>
  state.children[parentId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectChildren(Store<AppState> store, int parentId) =>
  selectChildrenFromCommentsState(store.state.comments, parentId);

int selectNumberOfNotDisplayedChildren(Store<AppState> store, bool isVisible, CommentState comment) =>
  comment.numberOfChildren - (isVisible ? store.state.comments.children[comment.id]?.values.length ?? 0 : 0);

Pagination<int, CommentUserLikeState> selectCommentUserLikesFromState(CommentsState state, int commentId) =>
  state.commentUserLikes[commentId] ?? Pagination.init(usersPerPage, true);
Pagination<int, CommentUserLikeState> selectCommentUserLikes(Store<AppState> store, int commentId) =>
  selectCommentUserLikesFromState(store.state.comments, commentId);
Future<bool> onCommentUserLikesLoaded(Store<AppState> store, int commentId) =>
  store.onChange.map((state) => !selectChildrenFromCommentsState(store.state.comments, commentId).loadingNext).first;
