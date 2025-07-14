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
EntityState<int,QuestionState> addVideoSolutionReducer(EntityState<int,QuestionState> prev,AddQuestionVideoSolutionAction action)
  => prev.updateOne(prev.getValue(action.questionId)!.addVideoSolution(action.solutionId));

//get solutions

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

  //video solutions
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsAction>(nextVideoSolutionsReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsSuccessAction>(nextVideoSolutionsSuccessReducer).call,
  TypedReducer<EntityState<int,QuestionState>,NextQuestionVideoSolutionsFailedAction>(nextVideoSolutionsFailedReducer).call,
  TypedReducer<EntityState<int,QuestionState>,AddQuestionVideoSolutionAction>(addVideoSolutionReducer).call,
]);
