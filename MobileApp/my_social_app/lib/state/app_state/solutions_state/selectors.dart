import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/to_pagination_state.dart';
import 'package:redux/redux.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart' as pagination;

//question solutions
KeyPagination<int> selectQuestionSolutionsKeyPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
pagination.Page<int> selectQuestionSolutionsNextPage(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsKeyPaginationFromState(store.state.solutions,questionId).next;
pagination.Page<int> selectQuestionSolutionsFirstPage(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsKeyPaginationFromState(store.state.solutions,questionId).first;
KeyPagination<int> selectQuestionSolutionsKeyPagination(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsKeyPaginationFromState(store.state.solutions, questionId);
Pagination<int,SolutionState> selectQuestionSolutionsPagination(Store<AppState> store, int questionId) =>
  toPaginationState(store.state.solutions.solutions, selectQuestionSolutionsKeyPagination(store,questionId));
Future<bool> onQuestionSolutionsLoaded(Store<AppState> store,int questionId) =>
  store
    .onChange
    .map((state) => !selectQuestionSolutionsKeyPaginationFromState(state.solutions, questionId).loadingNext)
    .first;
//question solutions

// question correct solutions
KeyPagination<int> selectQuestionCorrectSolutionsKeyPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionCorrectSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
pagination.Page<int> selectQuestionCorrectSolutionsNextPage(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsKeyPaginationFromState(store.state.solutions,questionId).next;
pagination.Page<int> selectQuestionCorrectSolutionsFirstPage(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsKeyPaginationFromState(store.state.solutions,questionId).first;
KeyPagination<int> selectQuestionCorrectSolutionsKeyPagination(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsKeyPaginationFromState(store.state.solutions, questionId);
Pagination<int,SolutionState> selectQuestionCorrectSolutionsPagination(Store<AppState> store, int questionId) =>
  toPaginationState(store.state.solutions.solutions, selectQuestionCorrectSolutionsKeyPagination(store,questionId));
Future<bool> onQuestionCorrectSolutionsLoaded(Store<AppState> store,int questionId) =>
  store
    .onChange
    .map((state) => !selectQuestionCorrectSolutionsKeyPaginationFromState(state.solutions, questionId).loadingNext)
    .first;
// question correct solutions

//question pending solutions
KeyPagination<int> selectQuestionPendingSolutionsKeyPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionPendingSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
pagination.Page<int> selectQuestionPendingSolutionsNextPage(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsKeyPaginationFromState(store.state.solutions,questionId).next;
pagination.Page<int> selectQuestionPendingSolutionsFirstPage(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsKeyPaginationFromState(store.state.solutions,questionId).first;
KeyPagination<int> selectQuestionPendingSolutionsKeyPagination(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsKeyPaginationFromState(store.state.solutions, questionId);
Pagination<int,SolutionState> selectQuestionPendingSolutionsPagination(Store<AppState> store, int questionId) =>
  toPaginationState(store.state.solutions.solutions, selectQuestionPendingSolutionsKeyPagination(store,questionId));
Future<bool> onQuestionPendingSolutionsLoaded(Store<AppState> store,int questionId) =>
  store
    .onChange
    .map((state) => !selectQuestionPendingSolutionsKeyPaginationFromState(state.solutions, questionId).loadingNext)
    .first;
//question pending solutions

//question incorrect solutions
KeyPagination<int> selectQuestionIncorrectSolutionsKeyPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionIncorrectSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
pagination.Page<int> selectQuestionIncorrectSolutionsNextPage(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsKeyPaginationFromState(store.state.solutions,questionId).next;
pagination.Page<int> selectQuestionIncorrectSolutionsFirstPage(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsKeyPaginationFromState(store.state.solutions,questionId).first;
KeyPagination<int> selectQuestionIncorrectSolutionsKeyPagination(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsKeyPaginationFromState(store.state.solutions, questionId);
Pagination<int,SolutionState> selectQuestionIncorrectSolutionsPagination(Store<AppState> store, int questionId) =>
  toPaginationState(store.state.solutions.solutions, selectQuestionIncorrectSolutionsKeyPagination(store,questionId));
Future<bool> onQuestionIncorrectSolutionsLoaded(Store<AppState> store,int questionId) =>
  store
    .onChange
    .map((state) => !selectQuestionIncorrectSolutionsKeyPaginationFromState(state.solutions, questionId).loadingNext)
    .first;
//question incorrect solutions

//question video solutions
KeyPagination<int> selectQuestionVideoSolutionsKeyPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionVideoSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
pagination.Page<int> selectQuestionVideoSolutionsNextPage(Store<AppState> store, int questionId) =>
  selectQuestionVideoSolutionsKeyPaginationFromState(store.state.solutions,questionId).next;
pagination.Page<int> selectQuestionVideoSolutionsFirstPage(Store<AppState> store, int questionId) =>
  selectQuestionVideoSolutionsKeyPaginationFromState(store.state.solutions,questionId).first;
KeyPagination<int> selectQuestionVideoSolutionsKeyPagination(Store<AppState> store, int questionId) =>
  selectQuestionVideoSolutionsKeyPaginationFromState(store.state.solutions, questionId);
Pagination<int,SolutionState> selectQuestionVideoSolutionsPagination(Store<AppState> store, int questionId) =>
  toPaginationState(store.state.solutions.solutions, selectQuestionVideoSolutionsKeyPagination(store,questionId));
Future<bool> onQuestionVideoSolutionsLoaded(Store<AppState> store,int questionId) =>
  store
    .onChange
    .map((state) => !selectQuestionVideoSolutionsKeyPaginationFromState(state.solutions, questionId).loadingNext)
    .first;
//question video solutions

// Pagination<int, SolutionUserSaveState> selectSavedSolutionsFromState(SolutionsState state) =>
//   state.savedSolutions;
// Pagination<int, SolutionUserSaveState> selectSavedSolutions(Store<AppState> store) =>
//   selectSavedSolutionsFromState(store.state.solutions);