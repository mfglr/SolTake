import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

Iterable<CommentStateId> selectQuestionComments(Store<AppState> store, int questionId)
  => store.state.comments.where((e) => e.questionId == questionId).values;