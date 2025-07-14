import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, SolutionState> selectQuestionSolutionsFromState(SolutionsState state, int questionId) =>
  (state.questionSolutions[questionId] ?? Pagination.init(solutionsPerPage, true));
Pagination<int, SolutionState> selectQuestionSolutions(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsFromState(store.state.solutions, questionId);

Pagination<int, SolutionState> selectQuestionCorrectSolutionsFromState(SolutionsState state, int questionId) =>
  (state.questionCorrectSolutions[questionId] ?? Pagination.init(solutionsPerPage, true));
Pagination<int, SolutionState> selectQuestionCorrectSolutions(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsFromState(store.state.solutions, questionId);

Pagination<int, SolutionState> selectQuestionPendingSolutionsFromState(SolutionsState state, int questionId) =>
  (state.questionPendingSolutions[questionId] ?? Pagination.init(solutionsPerPage, true));
Pagination<int, SolutionState> selectQuestionPendingSolutions(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsFromState(store.state.solutions, questionId);

Pagination<int, SolutionState> selectQuestionIncorrectSolutionsFromState(SolutionsState state, int questionId) =>
  (state.questionIncorrectSolutions[questionId] ?? Pagination.init(solutionsPerPage, true));
Pagination<int, SolutionState> selectQuestionIncorrectSolutions(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsFromState(store.state.solutions, questionId);