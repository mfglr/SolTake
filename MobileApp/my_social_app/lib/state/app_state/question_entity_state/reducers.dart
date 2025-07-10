import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

//questions
EntityState<int,QuestionState> addQuestionReducer(EntityState<int,QuestionState> prev,AddQuestionAction action)
  => prev.appendOne(action.value);
EntityState<int,QuestionState> addQuestionsReducer(EntityState<int,QuestionState> prev,AddQuestionsAction action)
  => prev.appendMany(action.questions);
EntityState<int,QuestionState> removeQuestionReducer(EntityState<int,QuestionState> prev,DeleteQuestionSuccessAction action)
  => prev.removeOne(action.questionId);

//save
EntityState<int,QuestionState> saveQuestionReducer(EntityState<int,QuestionState> prev,SaveQuestionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.save());
EntityState<int,QuestionState> unsaveQuestionReducer(EntityState<int,QuestionState> prev,UnsaveQuestionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.unsave());

//solutions
EntityState<int,QuestionState> markSolutionAsCorrectReducer(EntityState<int,QuestionState> prev, MarkQuestionSolutionAsCorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsCorrect(action.solutionId));
EntityState<int,QuestionState> markSolutionAsIncorrectReducer(EntityState<int,QuestionState> prev,MarkQuestionSolutionAsIncorrectAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.markSolutionAsIncorrect(action.solutionId));
EntityState<int,QuestionState> createNewSolutionReducer(EntityState<int,QuestionState> prev,CreateNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewSolution(action.solutionId));
EntityState<int,QuestionState> createNewVideoSolutionReducer(EntityState<int,QuestionState> prev,CreateNewQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.createNewVideoSolution(action.solutionId)); 
EntityState<int,QuestionState> addNewSolutionReducer(EntityState<int,QuestionState> prev,AddNewQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNewSolution(action.solutionId));
EntityState<int,QuestionState> removeSolutionReducer(EntityState<int,QuestionState> prev,RemoveQuestionSolutionAction action)
  => prev.updateOne(prev.getValue(action.solution.questionId)!.removeSolution(action.solution));
EntityState<int,QuestionState> addVideoSolutionReducer(EntityState<int,QuestionState> prev,AddQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addVideoSolution(action.solutionId));

//get solutions
EntityState<int,QuestionState> nextSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextSolutions());
EntityState<int,QuestionState> nextSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextSolutions(action.solutionIds));
EntityState<int,QuestionState> nextSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextSolutions());

//get correct solutions
EntityState<int,QuestionState> nextCorrectSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextCorrectSolutions());
EntityState<int,QuestionState> nextCorrectSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageCorrectSolutions(action.solutionIds));
EntityState<int,QuestionState> nextCorrectSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionCorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextCorrectSolutions());

//get pending solutions
EntityState<int,QuestionState> nextPendingSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextPendingSolutions());
EntityState<int,QuestionState> nextPendingSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPagePedingSolutions(action.solutionIds));
EntityState<int,QuestionState> nextPendingSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionPendingSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextPendingSolutions());

//get incorrect solutions
EntityState<int,QuestionState> nextIncorrectSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextIncorrectSolutions());
EntityState<int,QuestionState> nextIncorrectSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextIncorrectSolutions(action.solutionIds));
EntityState<int,QuestionState> nextIncorrectSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionIncorrectSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLoadingNextIncorrectSolutions());

//get video solutions
EntityState<int,QuestionState> nextVideoSolutionsReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.startLoadingNextVideoSolutions());
EntityState<int,QuestionState> nextVideoSolutionsSuccessReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addNextPageVideoSolutions(action.solutionIds));
EntityState<int,QuestionState> nextVideoSolutionsFailedReducer(EntityState<int,QuestionState> prev,NextQuestionVideoSolutionsFailedAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.stopLodingNextVideoSolutions());


Reducer<EntityState<int,QuestionState>> questionsReducer = combineReducers<EntityState<int,QuestionState>>([
  TypedReducer<EntityState<int,QuestionState>,AddQuestionAction>(addQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionsAction>(addQuestionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,DeleteQuestionSuccessAction>(removeQuestionReducer).call,

  //saves
  TypedReducer<EntityState<int,QuestionState>,SaveQuestionAction>(saveQuestionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,UnsaveQuestionAction>(unsaveQuestionReducer).call,

  //
  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsCorrectAction>(markSolutionAsCorrectReducer).call,
  TypedReducer<EntityState<int,QuestionState>,MarkQuestionSolutionAsIncorrectAction>(markSolutionAsIncorrectReducer).call,

  //solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsAction>(nextSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsSuccessAction>(nextSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionSolutionsFailedAction>(nextSolutionsFailedReducer).call,

  //correct solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsAction>(nextCorrectSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsSuccessAction>(nextCorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionCorrectSolutionsFailedAction>(nextCorrectSolutionsFailedReducer).call,

  //pending solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsAction>(nextPendingSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsSuccessAction>(nextPendingSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionPendingSolutionsFailedAction>(nextPendingSolutionsFailedReducer).call,

  //Incorrect solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsAction>(nextIncorrectSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsSuccessAction>(nextIncorrectSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionIncorrectSolutionsFailedAction>(nextIncorrectSolutionsFailedReducer).call,
  
  //video solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsAction>(nextVideoSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsSuccessAction>(nextVideoSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsFailedAction>(nextVideoSolutionsFailedReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,

  TypedReducer<EntityState<int,QuestionState>,CreateNewQuestionSolutionAction>(createNewSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,CreateNewQuestionVideoSolutionAction>(createNewVideoSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddNewQuestionSolutionAction>(addNewSolutionReducer).call,
  TypedReducer<EntityState<int,QuestionState>,RemoveQuestionSolutionAction>(removeSolutionReducer).call,
]);
