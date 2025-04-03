import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

QuestionState? selectQuestion(Store<AppState> store,int questionId)
  => store.state.questionEntityState.getValue(questionId);

Pagination<int,QuestionUserLikeState> selectQuestionLikesPagination(Store<AppState> store,int questionId)
  => selectQuestion(store, questionId)!.likes;
Page<int> selectQuestionNextLikesPage(Store<AppState> store,int questionId)
  => selectQuestionLikesPagination(store,questionId).next;
Page<int> selectQuestionPrevLikesPage(Store<AppState> store,int questionId)
  => selectQuestionLikesPagination(store,questionId).prev;

Pagination<int,Id<int>> selectQuestionCommentsPagination(Store<AppState> store, int questionId)
  => selectQuestion(store, questionId)?.comments ?? Pagination.init(commentsPerPage, true);
Page<int> selectQuestionNextCommentsPage(Store<AppState> store, int questionId)
  => selectQuestionCommentsPagination(store, questionId).next;
Page<int> selectQuestionPrevCommentsPage(Store<AppState> store, int questionId)
  => selectQuestionCommentsPagination(store, questionId).prev;

