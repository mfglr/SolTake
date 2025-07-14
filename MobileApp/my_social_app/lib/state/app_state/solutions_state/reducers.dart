import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:redux/redux.dart';

SolutionsState nextQuestionSolutionsReducer(SolutionsState prev, NextQuestionSolutionsAction action)
  => prev.startLoadingNextQuestionSolutions(action.questionId);
SolutionsState nextQuestionSolutionsSuccessReducer(SolutionsState prev, NextQuestionSolutionsSuccessAction action)
  => prev.addNextPageQuestionSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionSolutionsFailedReducer(SolutionsState prev, NextQuestionSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionSolutions(action.questionId);

SolutionsState nextQuestionCorrectSolutionsReducer(SolutionsState prev, NextQuestionCorrectSolutionsAction action)
  => prev.startLoadingNextQuestionCorrectSolutions(action.questionId);
SolutionsState nextQuestionCorrectSolutionsSuccessReducer(SolutionsState prev, NextQuestionCorrectSolutionsSuccessAction action)
  => prev.addNextPageQuestionCorrectSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionCorrectSolutionsFailedReducer(SolutionsState prev, NextQuestionCorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionCorrectSolutions(action.questionId);

SolutionsState nextQuestionPendingSolutionsReducer(SolutionsState prev, NextQuestionPendingSolutionsAction action)
  => prev.startLoadingNextQuestionPendingSolutions(action.questionId);
SolutionsState nextQuestionPendingSolutionsSuccessReducer(SolutionsState prev, NextQuestionPendingSolutionsSuccessAction action)
  => prev.addNextPageQuestionPendingSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionPendingSolutionsFailedReducer(SolutionsState prev, NextQuestionPendingSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionPendingSolutions(action.questionId);

SolutionsState nextQuestionIncorrectSolutionsReducer(SolutionsState prev, NextQuestionIncorrectSolutionsAction action)
  => prev.startLoadingNextQuestionIncorrectSolutions(action.questionId);
SolutionsState nextQuestionIncorrectSolutionsSuccessReducer(SolutionsState prev, NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.addNextPageQuestionIncorrectSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionIncorrectSolutionsFailedReducer(SolutionsState prev, NextQuestionIncorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionIncorrectSolutions(action.questionId);

Reducer<SolutionsState> solutionsReducer = combineReducers<SolutionsState>([
  TypedReducer<SolutionsState,NextQuestionSolutionsAction>(nextQuestionSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionSolutionsSuccessAction>(nextQuestionSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionSolutionsFailedAction>(nextQuestionSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsAction>(nextQuestionCorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsSuccessAction>(nextQuestionCorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionPendingSolutionsAction>(nextQuestionPendingSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsSuccessAction>(nextQuestionPendingSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsAction>(nextQuestionIncorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsSuccessAction>(nextQuestionIncorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsFailedAction>(nextQuestionIncorrectSolutionsFailedReducer).call,
]);