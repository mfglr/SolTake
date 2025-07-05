import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

QuestionState? selectQuestion(Store<AppState> store,int questionId)
  => store.state.questionEntityState.getValue(questionId);

Pagination<int,Id<int>> selectQuestionCommentsPagination(Store<AppState> store, int questionId)
  => selectQuestion(store, questionId)?.comments ?? Pagination.init(commentsPerPage, true);
Page<int> selectQuestionNextCommentsPage(Store<AppState> store, int questionId)
  => selectQuestionCommentsPagination(store, questionId).next;
Page<int> selectQuestionPrevCommentsPage(Store<AppState> store, int questionId)
  => selectQuestionCommentsPagination(store, questionId).prev;

Pagination<int,Id<int>> selectQuestionSolutionsPagination(Store<AppState> store, int questionId)
  => selectQuestion(store, questionId)?.solutions ?? Pagination.init(solutionsPerPage, true);
Page<int> selectQuestionNextSolutionsPage(Store<AppState> store, int questionId)
  => selectQuestionSolutionsPagination(store, questionId).next;
Page<int> selectQuestionPrevSolutionsPage(Store<AppState> store, int questionId)
  => selectQuestionSolutionsPagination(store, questionId).prev;



