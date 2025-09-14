import 'package:my_social_app/state/solution_votes_state/actions.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/solutions_state.dart';
import 'package:redux/redux.dart';

// solutions
SolutionsState loadSolutionReducer(SolutionsState prev, LoadSolutionAction action) =>
  prev.loading(action.solutionId);
SolutionsState loadSolutionSuccessReducer(SolutionsState prev, LoadSolutionSuccessAction action) =>
  prev.success(action.solution);
SolutionsState loadSolutionFailedReducer(SolutionsState prev, LoadSolutionFailedAction action) =>
  prev.failed(action.solutionId);
SolutionsState solutionNotFoundReducer(SolutionsState prev, SolutionNotFoundAction action) =>
  prev.notFound(action.solutionId);

SolutionsState createSolutionSuccessReducer(SolutionsState prev, CreateSolutionSuccessAction action)
  => prev.create(action.solution);
SolutionsState deleteSolutionSuccessReducer(SolutionsState prev, DeleteSolutionSuccessAction action)
  => prev.delete(action.solution);

SolutionsState makeSolutionUpvoteSuccessReducer(SolutionsState prev, MakeSolutionUpvoteSuccessAction action) =>
  prev.makeUpvote(action.solution);
SolutionsState removeUpvoteSuccessReducer(SolutionsState prev, RemoveSolutionUpvoteSuccessAction action) =>
  prev.removeUpvote(action.solution);

SolutionsState makeSolutionDownvoteSuccessReducer(SolutionsState prev, MakeSolutionDownvoteSuccessAction action) =>
  prev.makeDownvote(action.solution);
SolutionsState removeDownvoteSuccessReducer(SolutionsState prev, RemoveSolutionDownvoteSuccessAction action) =>
  prev.removeDownvote(action.solution);

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

//question correct solutions
SolutionsState nextQuestionCorrectSolutionsReducer(SolutionsState prev, NextQuestionCorrectSolutionsAction action)
  => prev.startLoadingNextQuestionCorrectSolutions(action.questionId);
SolutionsState nextQuestionCorrectSolutionsSuccessReducer(SolutionsState prev, NextQuestionCorrectSolutionsSuccessAction action)
  => prev.addNextPageQuestionCorrectSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionCorrectSolutionsFailedReducer(SolutionsState prev, NextQuestionCorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionCorrectSolutions(action.questionId);

SolutionsState refreshQuestionCorrectSolutionsReducer(SolutionsState prev, RefreshQuestionCorrectSolutionsAction action)
  => prev.startLoadingNextQuestionCorrectSolutions(action.questionId);
SolutionsState refreshQuestionCorrectSolutionsSuccessReducer(SolutionsState prev, RefreshQuestionCorrectSolutionsSuccessAction action)
  => prev.refreshQuestionCorrectSolutions(action.questionId, action.solutions);
SolutionsState refreshQuestionCorrectSolutionsFailedReducer(SolutionsState prev, RefreshQuestionCorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionCorrectSolutions(action.questionId);
//question correct solutions

//question pending solutions
SolutionsState nextQuestionPendingSolutionsReducer(SolutionsState prev, NextQuestionPendingSolutionsAction action)
  => prev.startLoadingNextQuestionPendingSolutions(action.questionId);
SolutionsState nextQuestionPendingSolutionsSuccessReducer(SolutionsState prev, NextQuestionPendingSolutionsSuccessAction action)
  => prev.addNextPageQuestionPendingSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionPendingSolutionsFailedReducer(SolutionsState prev, NextQuestionPendingSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionPendingSolutions(action.questionId);

SolutionsState refreshQuestionPendingSolutionsReducer(SolutionsState prev, RefreshQuestionPendingSolutionsAction action)
  => prev.startLoadingNextQuestionPendingSolutions(action.questionId);
SolutionsState refreshQuestionPendingSolutionsSuccessReducer(SolutionsState prev, RefreshQuestionPendingSolutionsSuccessAction action)
  => prev.refreshQuestionPendingSolutions(action.questionId, action.solutions);
SolutionsState refreshQuestionPendingSolutionsFailedReducer(SolutionsState prev, RefreshQuestionPendingSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionPendingSolutions(action.questionId);
//question pending solutions

//question incorrect solutions
SolutionsState nextQuestionIncorrectSolutionsReducer(SolutionsState prev, NextQuestionIncorrectSolutionsAction action)
  => prev.startLoadingNextQuestionIncorrectSolutions(action.questionId);
SolutionsState nextQuestionIncorrectSolutionsSuccessReducer(SolutionsState prev, NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.addNextPageQuestionIncorrectSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionIncorrectSolutionsFailedReducer(SolutionsState prev, NextQuestionIncorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionIncorrectSolutions(action.questionId);

SolutionsState refreshQuestionIncorrectSolutionsReducer(SolutionsState prev, RefreshQuestionIncorrectSolutionsAction action)
  => prev.startLoadingNextQuestionIncorrectSolutions(action.questionId);
SolutionsState refreshQuestionIncorrectSolutionsSuccessReducer(SolutionsState prev, RefreshQuestionIncorrectSolutionsSuccessAction action)
  => prev.refreshQuestionIncorrectSolutions(action.questionId, action.solutions);
SolutionsState refreshQuestionIncorrectSolutionsFailedReducer(SolutionsState prev, RefreshQuestionIncorrectSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionIncorrectSolutions(action.questionId);
//question incorrect solutions

//question video solutions
SolutionsState nextQuestionVideoSolutionsReducer(SolutionsState prev, NextQuestionVideoSolutionsAction action)
  => prev.startLoadingNextQuestionVideoSolutions(action.questionId);
SolutionsState nextQuestionVideoSolutionsSuccessReducer(SolutionsState prev, NextQuestionVideoSolutionsSuccessAction action)
  => prev.addNextPageQuestionVideoSolutions(action.questionId, action.solutions);
SolutionsState nextQuestionVideoSolutionsFailedReducer(SolutionsState prev, NextQuestionVideoSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionVideoSolutions(action.questionId);

SolutionsState refreshQuestionVideoSolutionsReducer(SolutionsState prev, RefreshQuestionVideoSolutionsAction action)
  => prev.startLoadingNextQuestionVideoSolutions(action.questionId);
SolutionsState refreshQuestionVideoSolutionsSuccessReducer(SolutionsState prev, RefreshQuestionVideoSolutionsSuccessAction action)
  => prev.refreshQuestionVideoSolutions(action.questionId, action.solutions);
SolutionsState refreshQuestionVideoSolutionsFailedReducer(SolutionsState prev, RefreshQuestionVideoSolutionsFailedAction action)
  => prev.stopLoadingNextQuestionVideoSolutions(action.questionId);
//question video solutions


Reducer<SolutionsState> solutionsReducer = combineReducers<SolutionsState>([
  //solutions
  TypedReducer<SolutionsState,LoadSolutionAction>(loadSolutionReducer).call,
  TypedReducer<SolutionsState,LoadSolutionSuccessAction>(loadSolutionSuccessReducer).call,
  TypedReducer<SolutionsState,LoadSolutionFailedAction>(loadSolutionFailedReducer).call,
  TypedReducer<SolutionsState,SolutionNotFoundAction>(solutionNotFoundReducer).call,

  TypedReducer<SolutionsState,CreateSolutionSuccessAction>(createSolutionSuccessReducer).call,
  TypedReducer<SolutionsState,DeleteSolutionSuccessAction>(deleteSolutionSuccessReducer).call,

  TypedReducer<SolutionsState,MakeSolutionUpvoteSuccessAction>(makeSolutionUpvoteSuccessReducer).call,
  TypedReducer<SolutionsState,RemoveSolutionUpvoteSuccessAction>(removeUpvoteSuccessReducer).call,

  TypedReducer<SolutionsState,MakeSolutionDownvoteSuccessAction>(makeSolutionDownvoteSuccessReducer).call,
  TypedReducer<SolutionsState,RemoveSolutionDownvoteSuccessAction>(removeDownvoteSuccessReducer).call,

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
  
  //question correct solutions
  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsAction>(nextQuestionCorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionCorrectSolutionsSuccessAction>(nextQuestionCorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,
  
  TypedReducer<SolutionsState,RefreshQuestionCorrectSolutionsAction>(refreshQuestionCorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionCorrectSolutionsSuccessAction>(refreshQuestionCorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionPendingSolutionsFailedAction>(refreshQuestionPendingSolutionsFailedReducer).call,
  //question correct solutions

  //question pending solutions
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsAction>(nextQuestionPendingSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsSuccessAction>(nextQuestionPendingSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionPendingSolutionsFailedAction>(nextQuestionPendingSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,RefreshQuestionPendingSolutionsAction>(refreshQuestionPendingSolutionsReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionPendingSolutionsSuccessAction>(refreshQuestionPendingSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionPendingSolutionsFailedAction>(refreshQuestionPendingSolutionsFailedReducer).call,
  //question pending solutions

  //question incorrect solutions
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsAction>(nextQuestionIncorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsSuccessAction>(nextQuestionIncorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionIncorrectSolutionsFailedAction>(nextQuestionIncorrectSolutionsFailedReducer).call,
  
  TypedReducer<SolutionsState,RefreshQuestionIncorrectSolutionsAction>(refreshQuestionIncorrectSolutionsReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionIncorrectSolutionsSuccessAction>(refreshQuestionIncorrectSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionIncorrectSolutionsFailedAction>(refreshQuestionIncorrectSolutionsFailedReducer).call,
  //question incorrect solutions

  //question video solutions
  TypedReducer<SolutionsState,NextQuestionVideoSolutionsAction>(nextQuestionVideoSolutionsReducer).call,
  TypedReducer<SolutionsState,NextQuestionVideoSolutionsSuccessAction>(nextQuestionVideoSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,NextQuestionVideoSolutionsFailedAction>(nextQuestionVideoSolutionsFailedReducer).call,

  TypedReducer<SolutionsState,RefreshQuestionVideoSolutionsAction>(refreshQuestionVideoSolutionsReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionVideoSolutionsSuccessAction>(refreshQuestionVideoSolutionsSuccessReducer).call,
  TypedReducer<SolutionsState,RefreshQuestionVideoSolutionsFailedAction>(refreshQuestionVideoSolutionsFailedReducer).call,
  //question video solutions
]);