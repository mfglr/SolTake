import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:redux/redux.dart';

Iterable<CommentState> selectQuestionComments(Store<AppState> store, int questionId) =>
  store.state.comments.select((e) => e.questionId == questionId);
Page<int> selectQuestionCommentsNextPage(Store<AppState> store, int questionId) =>
  Page<int>(
    offset: selectQuestionComments(store, questionId).lastOrNull?.id,
    take: commentsPerPage,
    isDescending: true
  );
Page<int> get selectQuestionCommentsFirstPage =>
  const Page<int>(
    offset: null,
    take: commentsPerPage,
    isDescending: true
  );