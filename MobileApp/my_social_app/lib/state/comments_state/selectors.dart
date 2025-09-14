import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,CommentState> selectQuestionComments(Store<AppState> store, int solutionId) =>
  store.state.comments.selectQuestionComments(solutionId);
Future<bool> onQuestionCommentsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.comments.selectQuestionComments(questionId).loadingNext).first;

Pagination<int,CommentState> selectSolutionComments(Store<AppState> store, int solutionId) =>
  store.state.comments.selectSolutionComments(solutionId);
Future<bool> onSolutionCommentsLoaded(Store<AppState> store, int solutionId) =>
  store.onChange.map((state) => !state.comments.selectSolutionComments(solutionId).loadingNext).first;

Pagination<int,CommentState> selectCommentComments(Store<AppState> store, int commentId) =>
  store.state.comments.selectCommentComments(commentId);
Future<bool> onCommentCommentsLoaded(Store<AppState> store, int commentId) =>
  store.onChange.map((state) => !state.comments.selectCommentComments(commentId).loadingNext).first;

int selectNumberOfNotDisplayedCommentComments(Store<AppState> store, bool isVisible, CommentState comment) =>
  store.state.comments.selectNumberOfNotDisplayedCommentComments(isVisible, comment);

