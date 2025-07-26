import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/solutions_state.dart';
import 'package:redux/redux.dart';

// solutions
SolutionsState createSolutionSuccessReducer(SolutionsState prev, CreateSolutionSuccessAction action)
  => prev.create(action.solution);
SolutionsState deleteSolutionSuccessReducer(SolutionsState prev, DeleteSolutionSuccessAction action)
  => prev.delete(action.solution);
SolutionsState markAsCorrectSuccessReducer(SolutionsState prev, MarkSolutionAsCorrectSuccessAction action)
  => prev.markAsCorrect(action.solution);
SolutionsState markAsIncorrectSuccessReducer(SolutionsState prev, MarkSolutionAsIncorrectSuccessAction action)
  => prev.markAsIncorrect(action.solution);
// solutions

//question solutions
SolutionsState nextQuestionSolutionsReducer(SolutionsState prev, NextQuestionSolutionsAction action)
  => prev.startLoadingNextQuestionSolutions(action.questionId);
SolutionsState nextQuestionSolutionsSuccessReducer(SolutionsState prev, NextQuestionSolutionsSuccessAction action)
  => prev.addNextPageQuestionSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionSolutionsFailedReducer(SolutionsState prev, NextQuestionSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionSolutions(action.questionId);

SolutionsState refreshQuestionSolutionsReducer(SolutionsState prev, RefreshQuestionSolutionsAction action)
  => prev.startLoadingNextQuestionSolutions(action.questionId);
SolutionsState refreshQuestionSolutionsSuccessReducer(SolutionsState prev, RefreshQuestionSolutionsSuccessAction action)
  => prev.refreshQuestionSolutions(action.questionId, action.solutions);
SolutionsState refreshQuestionSolutionsFailedReducer(SolutionsState prev, RefreshQuestionSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionSolutions(action.questionId);
//question solutions

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

SolutionsState nextQuestionVideoSolutionsReducer(SolutionsState prev, NextQuestionVideoSolutionsAction action)
  => prev.startLoadingNextQuestionVideoSolutions(action.questionId);
SolutionsState nextQuestionVideoSolutionsSuccessReducer(SolutionsState prev, NextQuestionVideoSolutionsSuccessAction action)
  => prev.addNextPageQuestionVideoSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionVideoSolutionsFailedReducer(SolutionsState prev, NextQuestionVideoSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionVideoSolutions(action.questionId);


Reducer<SolutionsState> solutionsReducer = combineReducers<SolutionsState>([
  //solutions
  TypedReducer<SolutionsState,CreateSolutionSuccessAction>(createSolutionSuccessReducer).call,
  TypedReducer<SolutionsState,DeleteSolutionSuccessAction>(deleteSolutionSuccessReducer).call,
  TypedReducer<SolutionsState,MarkSolutionAsCorrectSuccessAction>(markAsCorrectSuccessReducer).call,
  TypedReducer<SolutionsState,MarkSolutionAsIncorrectSuccessAction>(markAsIncorrectSuccessReducer).call,
  //solutions

  //question solutions
  TypedReducer<SolutionsState, NextQuestionSolutionsAction>(nextQuestionSolutionsReducer).call,
  TypedReducer<SolutionsState, NextQuestionSolutionsSuccessAction>(nextQuestionSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState, NextQuestionSolutionsFailedAction>(nextQuestionSolutionsFailedReducer).call,
  
  TypedReducer<SolutionsState, RefreshQuestionSolutionsAction>(refreshQuestionSolutionsReducer).call,
  TypedReducer<SolutionsState, RefreshQuestionSolutionsSuccessAction>(refreshQuestionSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState, RefreshQuestionSolutionsFailedAction>(refreshQuestionSolutionsFailedReducer).call,
  //question solutions
  
  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsAction>(nextQuestionCorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsSuccessAction>(nextQuestionCorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionPendingSolutionsAction>(nextQuestionPendingSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsSuccessAction>(nextQuestionPendingSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsAction>(nextQuestionIncorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsSuccessAction>(nextQuestionIncorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsFailedAction>(nextQuestionIncorrectSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,NextQuestionVideoSolutionsAction>(nextQuestionVideoSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionVideoSolutionsSuccessAction>(nextQuestionVideoSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionVideoSolutionsFailedAction>(nextQuestionVideoSolutionsFailedReducer).call,
]);