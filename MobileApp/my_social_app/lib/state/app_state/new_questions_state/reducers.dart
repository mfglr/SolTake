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

]);