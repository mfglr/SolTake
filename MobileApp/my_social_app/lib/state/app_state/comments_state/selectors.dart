import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comments_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, CommentState> selectQuestionComments(Store<AppState> store, int questionId) =>
  store.state.comments.questionComments[questionId] ?? Pagination.init(commentsPerPage, true);
Pagination<int, CommentState> selectSolutionComments(Store<AppState> store, int solutionId) =>
  store.state.comments.solutionComments[solutionId] ?? Pagination.init(commentsPerPage, true);
  
Pagination<int,CommentState> selectChildrenFromCommentsState(CommentsState state, int parentId) =>
  state.children[parentId] ?? Pagination.init(commentsPerPage, false);
Pagination<int, CommentState> selectChildren(Store<AppState> store, int parentId) =>
  selectChildrenFromCommentsState(store.state.comments, parentId);

int selectNumberOfNotDisplayedReplies(Store<AppState> store, bool isVisible, CommentState comment) =>
  comment.numberOfReplies - (isVisible ? store.state.comments.children[comment.id]?.values.length ?? 0 : 0);