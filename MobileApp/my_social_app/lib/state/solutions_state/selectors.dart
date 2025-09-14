import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/solutions_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/packages/entity_state/entity_container.dart';
import 'package:my_social_app/packages/entity_state/key_pagination.dart';
import 'package:redux/redux.dart';

EntityContainer<int, SolutionState> selectSolution(Store<AppState> store, int solutionId) =>
  store.state.solutions.solutions[solutionId];

KeyPagination<int> selectQuestionSolutionsPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
KeyPagination<int> selectQuestionSolutionsPagination(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsPaginationFromState(store.state.solutions, questionId);
Iterable<SolutionState> selectQuestionSolutions(Store<AppState> store, int questionId) =>
  selectQuestionSolutionsPagination(store, questionId).keys.map((key) => store.state.solutions.solutions[key].entity!);
(KeyPagination<int>, Iterable<SolutionState>) selectQuestionSolutionsAndPagination(Store<AppState> store, int questionId) =>
  (selectQuestionSolutionsPagination(store,questionId), selectQuestionSolutions(store, questionId));
Future<bool> onQuestionSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionSolutionsPaginationFromState(state.solutions, questionId).loadingNext).first;

KeyPagination<int> selectQuestionCorrectSolutionsPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionCorrectSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
KeyPagination<int> selectQuestionCorrectSolutionsPagination(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsPaginationFromState(store.state.solutions, questionId);
Iterable<SolutionState> selectQuestionCorrectSolutions(Store<AppState> store, int questionId) =>
  selectQuestionCorrectSolutionsPagination(store,questionId).keys.map((key) => store.state.solutions.solutions[key].entity!);
(KeyPagination<int>, Iterable<SolutionState>) selectQuestionCorrectSolutionsAndPagination(Store<AppState> store, int questionId) =>
  (selectQuestionCorrectSolutionsPagination(store,questionId), selectQuestionCorrectSolutions(store, questionId));
Future<bool> onQuestionCorrectSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionCorrectSolutionsPaginationFromState(state.solutions, questionId).loadingNext).first;

KeyPagination<int> selectQuestionPendingSolutionsPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionPendingSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
KeyPagination<int> selectQuestionPendingSolutionsPagination(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsPaginationFromState(store.state.solutions, questionId);
Iterable<SolutionState> selectQuestionPendingSolutions(Store<AppState> store, int questionId) =>
  selectQuestionPendingSolutionsPagination(store,questionId).keys.map((key) => store.state.solutions.solutions[key].entity!);
(KeyPagination<int>, Iterable<SolutionState>) selectQuestionPendingSolutionsAndPagination(Store<AppState> store, int questionId) =>
  (selectQuestionPendingSolutionsPagination(store,questionId), selectQuestionPendingSolutions(store, questionId));
Future<bool> onQuestionPendingSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionPendingSolutionsPaginationFromState(state.solutions, questionId).loadingNext).first;

KeyPagination<int> selectQuestionIncorrectSolutionsPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionIncorrectSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
KeyPagination<int> selectQuestionIncorrectSolutionsPagination(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsPaginationFromState(store.state.solutions, questionId);
Iterable<SolutionState> selectQuestionIncorrectSolutions(Store<AppState> store, int questionId) =>
  selectQuestionIncorrectSolutionsPagination(store,questionId).keys.map((key) => store.state.solutions.solutions[key].entity!);
(KeyPagination<int>, Iterable<SolutionState>) selectQuestionIncorrectSolutionsAndPagination(Store<AppState> store, int questionId) =>
  (selectQuestionIncorrectSolutionsPagination(store,questionId),selectQuestionIncorrectSolutions(store, questionId));
Future<bool> onQuestionIncorrectSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionIncorrectSolutionsPaginationFromState(state.solutions, questionId).loadingNext).first;

KeyPagination<int> selectQuestionVideoSolutionsPaginationFromState(SolutionsState state, int questionId) =>
  (state.questionVideoSolutions[questionId] ?? KeyPagination.init(solutionsPerPage, true));
KeyPagination<int> selectQuestionVideoSolutionsPagination(Store<AppState> store, int questionId) =>
  selectQuestionVideoSolutionsPaginationFromState(store.state.solutions, questionId);
Iterable<SolutionState> selectQuestionVideoSolutions(Store<AppState> store, int questionId) =>
  selectQuestionVideoSolutionsPagination(store,questionId).keys.map((key) => store.state.solutions.solutions[key].entity!);
(KeyPagination<int>, Iterable<SolutionState>) selectQuestionVideoSolutionsAndPagination(Store<AppState> store, int questionId) =>
  (selectQuestionVideoSolutionsPagination(store,questionId),selectQuestionVideoSolutions(store, questionId));
Future<bool> onQuestionVideoSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !selectQuestionVideoSolutionsPaginationFromState(state.solutions, questionId).loadingNext).first;
