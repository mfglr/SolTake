import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:redux/redux.dart';

EntityContainer<int, SolutionState> selectSolution(Store<AppState> store, int solutionId) =>
  store.state.solutions.solutions[solutionId];

//question solutions
ContainerPagination<int,SolutionState> selectQuestionSolutions(Store<AppState> store, int questionId) =>
  store.state.solutions.selectQuestionSolutions(questionId);
Future<bool> onQuestionSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.solutions.selectQuestionSolutions(questionId).loadingNext).first;
//question solutions


//question correct solutions
ContainerPagination<int,SolutionState> selectQuestionCorrectSolutions(Store<AppState> store, int questionId) =>
  store.state.solutions.selectQuestionCorrectSolutions(questionId);
Future<bool> onQuestionCorrectSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.solutions.selectQuestionCorrectSolutions(questionId).loadingNext).first;
//question correct solutions

//question pending solutions
ContainerPagination<int,SolutionState> selectQuestionPendingSolutions(Store<AppState> store, int questionId) =>
  store.state.solutions.selectQuestionPendingSolutions(questionId);
Future<bool> onQuestionPendingSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.solutions.selectQuestionPendingSolutions(questionId).loadingNext).first;
//question pending solutions

//question incorrect solutions
ContainerPagination<int,SolutionState> selectQuestionIncorrectSolutions(Store<AppState> store, int questionId) =>
  store.state.solutions.selectQuestionIncorrectSolutions(questionId);
Future<bool> onQuestionIncorrectSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.solutions.selectQuestionIncorrectSolutions(questionId).loadingNext).first;
//question incorrect solutions

//question video solutions
ContainerPagination<int,SolutionState> selectQuestionVideoSolutions(Store<AppState> store, int questionId) =>
  store.state.solutions.selectQuestionVideoSolutions(questionId);
Future<bool> onQuestionVideoSolutionsLoaded(Store<AppState> store, int questionId) =>
  store.onChange.map((state) => !state.solutions.selectQuestionVideoSolutions(questionId).loadingNext).first;
//question video solutions
