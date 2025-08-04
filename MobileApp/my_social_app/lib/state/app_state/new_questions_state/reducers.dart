import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/questions_state.dart';
import 'package:redux/redux.dart';

NewQuestionsState createQuestionSuccessReducer(NewQuestionsState prev, CreateQuestionSuccessAction action)
  => prev.create(action.question);

//home questions
NewQuestionsState nextHomeQuestionsReducer(NewQuestionsState prev, NextHomeQuestionsAction action) =>
  prev.startNextHomeQuestions();
NewQuestionsState nextHomeQuestionsSuccessReducer(NewQuestionsState prev, NextHomeQuestionsSuccessAction action) =>
  prev.addNextHomeQuestions(action.questions);
NewQuestionsState nextHomeQuestionsFailedReducer(NewQuestionsState prev, NextHomeQuestionsFailedAction action) =>
  prev.stopNextHomeQuestions();

NewQuestionsState refreshHomeQuestionsReducer(NewQuestionsState prev, RefreshHomeQuestionsAction action) =>
  prev.startNextHomeQuestions();
NewQuestionsState refreshHomeQuestionsSuccessReducer(NewQuestionsState prev, RefreshHomeQuestionsSuccessAction action) =>
  prev.refreshHomeQuestions(action.questions);
NewQuestionsState refreshHomeQuestionsFailedReducer(NewQuestionsState prev, RefreshHomeQuestionsFailedAction action) =>
  prev.stopNextHomeQuestions();
//home questions

//video questions
NewQuestionsState nextVideoQuestionsReducer(NewQuestionsState prev, NextVideoQuestionsAction action) =>
  prev.startNextVideoQuestions();
NewQuestionsState nextVideoQuestionsSuccessReducer(NewQuestionsState prev, NextVideoQuestionsSuccessAction action) =>
  prev.addNextVideoQuestions(action.questions);
NewQuestionsState nextVideoQuestionsFailedReducer(NewQuestionsState prev, NextVideoQuestionsFailedAction action) =>
  prev.stopNextVideoQuestions();

NewQuestionsState refreshVideoQuestionsReducer(NewQuestionsState prev, RefreshVideoQuestionsAction action) =>
  prev.startNextVideoQuestions();
NewQuestionsState refreshVideoQuestionsSuccessReducer(NewQuestionsState prev, RefreshVideoQuestionsSuccessAction action) =>
  prev.refreshVideoQuestions(action.questions);
NewQuestionsState refreshVideoQuestionsFailedReducer(NewQuestionsState prev, RefreshVideoQuestionsFailedAction action) =>
  prev.stopNextVideoQuestions();
//video questions

//user questions
NewQuestionsState nextUserQuestionsReducer(NewQuestionsState prev, NextUserQuestionsAction action) =>
  prev.startNextUserQuestions(action.userId);
NewQuestionsState nextUserQuestionsSuccessReducer(NewQuestionsState prev, NextUserQuestionsSuccessAction action) =>
  prev.addNextUserQuestions(action.userId, action.questions);
NewQuestionsState nextUserQuestionsFailedReducer(NewQuestionsState prev, NextUserQuestionsFailedAction action) =>
  prev.stopNextUserQuestions(action.userId);

NewQuestionsState refreshUserQuestionsReducer(NewQuestionsState prev, RefreshUserQuestionsAction action) =>
  prev.startNextUserQuestions(action.userId);
NewQuestionsState refreshUserQuestionsSuccessReducer(NewQuestionsState prev, RefreshUserQuestionsSuccessAction action) =>
  prev.refreshUserQuestions(action.userId, action.questions);
NewQuestionsState refreshUserQuestionsFailedReducer(NewQuestionsState prev, RefreshUserQuestionsFailedAction action) =>
  prev.stopNextUserQuestions(action.userId);
//user questions

//user solved questions
NewQuestionsState nextUserSolvedQuestionsReducer(NewQuestionsState prev, NextUserSolvedQuestionsAction action) =>
  prev.startNextUserSolvedQuestions(action.userId);
NewQuestionsState nextUserSolvedQuestionsSuccessReducer(NewQuestionsState prev, NextUserSolvedQuestionsSuccessAction action) =>
  prev.addNextUserSolvedQuestions(action.userId, action.questions);
NewQuestionsState nextUserSolvedQuestionsFailedReducer(NewQuestionsState prev, NextUserSolvedQuestionsFailedAction action) =>
  prev.stopNextUserSolvedQuestions(action.userId);

NewQuestionsState refreshUserSolvedQuestionsReducer(NewQuestionsState prev, RefreshUserSolvedQuestionsAction action) =>
  prev.startNextUserSolvedQuestions(action.userId);
NewQuestionsState refreshUserSolvedQuestionsSuccessReducer(NewQuestionsState prev, RefreshUserSolvedQuestionsSuccessAction action) =>
  prev.refreshUserSolvedQuestions(action.userId, action.questions);
NewQuestionsState refreshUserSolvedQuestionsFailedReducer(NewQuestionsState prev, RefreshUserSolvedQuestionsFailedAction action) =>
  prev.stopNextUserSolvedQuestions(action.userId);
//user solved questions

//user unsolved questions
NewQuestionsState nextUserUnsolvedQuestionsReducer(NewQuestionsState prev, NextUserUnsolvedQuestionsAction action) =>
  prev.startNextUserUnsolvedQuestions(action.userId);
NewQuestionsState nextUserUnsolvedQuestionsSuccessReducer(NewQuestionsState prev, NextUserUnsolvedQuestionsSuccessAction action) =>
  prev.addNextUserUnsolvedQuestions(action.userId, action.questions);
NewQuestionsState nextUserUnsolvedQuestionsFailedReducer(NewQuestionsState prev, NextUserUnsolvedQuestionsFailedAction action) =>
  prev.stopNextUserUnsolvedQuestions(action.userId);

NewQuestionsState refreshUserUnsolvedQuestionsReducer(NewQuestionsState prev, RefreshUserUnsolvedQuestionsAction action) =>
  prev.startNextUserUnsolvedQuestions(action.userId);
NewQuestionsState refreshUserUnsolvedQuestionsSuccessReducer(NewQuestionsState prev, RefreshUserUnsolvedQuestionsSuccessAction action) =>
  prev.refreshUserUnsolvedQuestions(action.userId, action.questions);
NewQuestionsState refreshUserUnsolvedQuestionsFailedReducer(NewQuestionsState prev, RefreshUserUnsolvedQuestionsFailedAction action) =>
  prev.stopNextUserUnsolvedQuestions(action.userId);
//user unsolved questions

//exam questions
NewQuestionsState nextExamQuestionsReducer(NewQuestionsState prev, NextExamQuestionsAction action) =>
  prev.startNextExamQuestions(action.examId);
NewQuestionsState nextExamQuestionsSuccessReducer(NewQuestionsState prev, NextExamQuestionsSuccessAction action) =>
  prev.addNextExamQuestions(action.examId, action.questions);
NewQuestionsState nextExamQuestionsFailedReducer(NewQuestionsState prev, NextExamQuestionsFailedAction action) =>
  prev.stopNextExamQuestions(action.examId);

NewQuestionsState refreshExamQuestionsReducer(NewQuestionsState prev, RefreshExamQuestionsAction action) =>
  prev.startNextExamQuestions(action.examId);
NewQuestionsState refreshExamQuestionsSuccessReducer(NewQuestionsState prev, RefreshExamQuestionsSuccessAction action) =>
  prev.refreshExamQuestions(action.examId, action.questions);
NewQuestionsState refreshExamQuestionsFailedReducer(NewQuestionsState prev, RefreshExamQuestionsFailedAction action) =>
  prev.stopNextExamQuestions(action.examId);
//exam questions



Reducer<NewQuestionsState> newQuestionsReducer = combineReducers<NewQuestionsState>([
  TypedReducer<NewQuestionsState, CreateQuestionSuccessAction>(createQuestionSuccessReducer).call,

  //home questions
  TypedReducer<NewQuestionsState, NextHomeQuestionsAction>(nextHomeQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextHomeQuestionsSuccessAction>(nextHomeQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextHomeQuestionsFailedAction>(nextHomeQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshHomeQuestionsAction>(refreshHomeQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshHomeQuestionsSuccessAction>(refreshHomeQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshHomeQuestionsFailedAction>(refreshHomeQuestionsFailedReducer).call,
  //home questions

  //video questions
  TypedReducer<NewQuestionsState, NextVideoQuestionsAction>(nextVideoQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextVideoQuestionsSuccessAction>(nextVideoQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextVideoQuestionsFailedAction>(nextVideoQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshVideoQuestionsAction>(refreshVideoQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshVideoQuestionsSuccessAction>(refreshVideoQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshVideoQuestionsFailedAction>(refreshVideoQuestionsFailedReducer).call,
  //video questions

  //user questions
  TypedReducer<NewQuestionsState, NextUserQuestionsAction>(nextUserQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextUserQuestionsSuccessAction>(nextUserQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextUserQuestionsFailedAction>(nextUserQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshUserQuestionsAction>(refreshUserQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserQuestionsSuccessAction>(refreshUserQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserQuestionsFailedAction>(refreshUserQuestionsFailedReducer).call,
  //user questions

  //user solved questions
  TypedReducer<NewQuestionsState, NextUserSolvedQuestionsAction>(nextUserSolvedQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextUserSolvedQuestionsSuccessAction>(nextUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextUserSolvedQuestionsFailedAction>(nextUserSolvedQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshUserSolvedQuestionsAction>(refreshUserSolvedQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserSolvedQuestionsSuccessAction>(refreshUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserSolvedQuestionsFailedAction>(refreshUserSolvedQuestionsFailedReducer).call,
  //user solved questions

  //user unsolved questions
  TypedReducer<NewQuestionsState, NextUserUnsolvedQuestionsAction>(nextUserUnsolvedQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextUserUnsolvedQuestionsSuccessAction>(nextUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextUserUnsolvedQuestionsFailedAction>(nextUserUnsolvedQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshUserUnsolvedQuestionsAction>(refreshUserUnsolvedQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserUnsolvedQuestionsSuccessAction>(refreshUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshUserUnsolvedQuestionsFailedAction>(refreshUserUnsolvedQuestionsFailedReducer).call,
  //user unsolved questions

  //home questions
  TypedReducer<NewQuestionsState, NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //home questions
]);