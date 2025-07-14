import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

Iterable<CommentStateId> selectQuestionComments(Store<AppState> store, int questionId)
  => store.state.comments.where((e) => e.questionId == questionId).values;
Iterable<CommentStateId> selectSolutionComments(Store<AppState> store, int solutionId)
  => store.state.comments.where((e) => e.solutionId == solutionId).values;
Iterable<CommentStateId> selectCommentChildren(Store<AppState> store, int parentId)
  => store.state.comments.where((e) => e.parentId == parentId).values;

int selectNumberOfNotDisplayedChildren(Store<AppState> store, bool isChildrenVisible, CommentState comment) =>
  comment.numberOfReplies - (isChildrenVisible ? selectCommentChildren(store, comment.id).length : 0);