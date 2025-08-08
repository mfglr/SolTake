import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:redux/redux.dart';

//questions
QuestionsState loadQuestionReducer(QuestionsState prev, LoadQuestionAction action) =>
  prev.load(action.questionId);
QuestionsState loadQuestionSuccessReducer(QuestionsState prev, LoadQuestionSuccessAction action) =>
  prev.success(action.question);
QuestionsState loadQuestionFailedReducer(QuestionsState prev, LoadQuestionFailedAction action) =>
  prev.failed(action.questionId);
QuestionsState loadQuestionNotFoundReducer(QuestionsState prev, LoadQuestionNotFoundAction action) =>
  prev.notFound(action.questionId);
QuestionsState deleteQuestionSuccessReducer(QuestionsState prev, DeleteQuestionSuccessAction action) =>
  prev.delete(action.question);
//questions

//solutions
QuestionsState markSolutionAsCorrectSuccessReducer(QuestionsState prev, MarkSolutionAsCorrectSuccessAction action) =>
  prev.markSolutionAsCorrect(action.question, action.solution);
QuestionsState markSolutionAsIncorrectSuccessReducer(QuestionsState prev, MarkSolutionAsIncorrectSuccessAction action) =>
  prev.markSolutionAsIncorrect(action.question, action.solution);
//solutions

//comments
QuestionsState createCommentSuccessReducer(QuestionsState prev, CreateCommentsSuccessAction action) =>
  action.question == null ? prev : prev.increaseNumberOfComments(action.question!);
QuestionsState deleteCommentSuccessReducer(QuestionsState prev, DeleteCommentSuccessAction action) =>
  action.comment.questionId == null ? prev : prev.decreaseNumberOfComments(action.question!);
//coments

//solutions action
QuestionsState createSolutionSuccessReducer(QuestionsState prev, CreateSolutionSuccessAction action)
  => prev.createSolution(action.question, action.solution);
QuestionsState deleteSolutionSuccessReducer(QuestionsState prev, DeleteSolutionSuccessAction action)
  => prev.deleteSolution(action.question, action.solution);
//solutions action

//question user saves
QuestionsState nextQuestionUserSavesReducer(QuestionsState prev, NextQuestionUserSavesAction action)
  => prev.startLoadingQuestionUserSaves();
QuestionsState nextQuestionUserSavesSuccessReducer(QuestionsState prev, NextQuestionUserSavesSuccessAction action)
  => prev.addNextPageQuestionUserSaves(action.questionUserSaves);
QuestionsState nextQuestionUserSavesFailedReducer(QuestionsState prev, NextQuestionUserSavesFailedAction action)
  => prev.stopLoadingNextQuestionUserSaves();

QuestionsState refreshQuestionUserSavesReducer(QuestionsState prev, RefreshQuestionUserSavesAction action)
  => prev.startLoadingQuestionUserSaves();
QuestionsState refreshQuestionUserSavesSuccessReducer(QuestionsState prev, RefreshQuestionUserSavesSuccessAction action)
  => prev.refreshQuesitonUserSaves(action.questionUserSaves);
QuestionsState refreshQuestionUserSavesFailedReducer(QuestionsState prev, NextQuestionUserSavesFailedAction action)
  => prev.stopLoadingNextQuestionUserSaves();

QuestionsState saveQuestionReducer(QuestionsState prev, SaveQuestionSuccessAction action)
  => prev.save(action.questionUserSave);
QuestionsState unsaveQuestionReducer(QuestionsState prev, UnsaveQuestionSuccessAction action)
  => prev.unsave(action.question);
//question user saves

Reducer<QuestionsState> questionsReducers = combineReducers<QuestionsState>([
  //questions
  TypedReducer<QuestionsState,LoadQuestionAction>(loadQuestionReducer).call,
  TypedReducer<QuestionsState,LoadQuestionSuccessAction>(loadQuestionSuccessReducer).call,
  TypedReducer<QuestionsState,LoadQuestionFailedAction>(loadQuestionFailedReducer).call,
  TypedReducer<QuestionsState,LoadQuestionNotFoundAction>(loadQuestionNotFoundReducer).call,

  TypedReducer<QuestionsState,DeleteQuestionSuccessAction>(deleteQuestionSuccessReducer).call,
  TypedReducer<QuestionsState,MarkSolutionAsCorrectSuccessAction>(markSolutionAsCorrectSuccessReducer).call,
  TypedReducer<QuestionsState,MarkSolutionAsIncorrectSuccessAction>(markSolutionAsIncorrectSuccessReducer).call,
  //questions

  //coments
  TypedReducer<QuestionsState,CreateCommentsSuccessAction>(createCommentSuccessReducer).call,
  //coments

  //solutions
  TypedReducer<QuestionsState,CreateSolutionSuccessAction>(createSolutionSuccessReducer).call,
  TypedReducer<QuestionsState,DeleteSolutionSuccessAction>(deleteSolutionSuccessReducer).call,
  //solutions

  //question user saves
  TypedReducer<QuestionsState,NextQuestionUserSavesAction>(nextQuestionUserSavesReducer).call,
  TypedReducer<QuestionsState,NextQuestionUserSavesSuccessAction>(nextQuestionUserSavesSuccessReducer).call,
  TypedReducer<QuestionsState,NextQuestionUserSavesFailedAction>(nextQuestionUserSavesFailedReducer).call,

  TypedReducer<QuestionsState,RefreshQuestionUserSavesAction>(refreshQuestionUserSavesReducer).call,
  TypedReducer<QuestionsState,RefreshQuestionUserSavesSuccessAction>(refreshQuestionUserSavesSuccessReducer).call,
  TypedReducer<QuestionsState,NextQuestionUserSavesFailedAction>(refreshQuestionUserSavesFailedReducer).call,

  TypedReducer<QuestionsState,SaveQuestionSuccessAction>(saveQuestionReducer).call,
  TypedReducer<QuestionsState,UnsaveQuestionSuccessAction>(unsaveQuestionReducer).call,
  //question user saves
]);
