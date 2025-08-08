import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/actions.dart';
import 'package:redux/redux.dart';

//questions
NewQuestionsState createQuestionSuccessReducer(NewQuestionsState prev, CreateQuestionSuccessAction action)
  => prev.create(action.question);
NewQuestionsState likeQuestionSuccessReducer(NewQuestionsState prev, LikeQuestionSuccessAction action)
  => prev.like(action.question);
NewQuestionsState dislikeQuestionSuccessReducer(NewQuestionsState prev, DislikeQuestionSuccessAction action)
  => prev.dislike(action.question);
//questions

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

//search questions
NewQuestionsState nextSearchPageQuestionsReducer(NewQuestionsState prev, NextSearchPageQuestionsAction action) =>
  prev.startNextSearchQuestions();
NewQuestionsState nextSearchPageQuestionsSuccessReducer(NewQuestionsState prev, NextSearchPageQuestionsSuccessAction action) =>
  prev.addNextSearchQuestions(action.questions);
NewQuestionsState nextSearchPageQuestionsFailedReducer(NewQuestionsState prev, NextSearchPageQuestionsFailedAction action) =>
  prev.stopNextSearchQuestions();

NewQuestionsState refreshSearchPageQuestionsReducer(NewQuestionsState prev, RefreshSearchPageQuestionsAction action) =>
  prev.startNextSearchQuestions();
NewQuestionsState refreshSearchPageQuestionsSuccessReducer(NewQuestionsState prev, RefreshSearchPageQuestionsSuccessAction action) =>
  prev.refreshSearchQuestions(action.questions);
NewQuestionsState refreshSearchPageQuestionsFailedReducer(NewQuestionsState prev, RefreshSearchPageQuestionsFailedAction action) =>
  prev.stopNextSearchQuestions();
//search questions

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

//subject questions
NewQuestionsState nextSubjectQuestionsReducer(NewQuestionsState prev, NextSubjectQuestionsAction action) =>
  prev.startNextSubjectQuestions(action.subjectId);
NewQuestionsState nextSubjectQuestionsSuccessReducer(NewQuestionsState prev, NextSubjectQuestionsSuccessAction action) =>
  prev.addNextSubjectQuestions(action.subjectId, action.questions);
NewQuestionsState nextSubjectQuestionsFailedReducer(NewQuestionsState prev, NextSubjectQuestionsFailedAction action) =>
  prev.stopNextSubjectQuestions(action.subjectId);

NewQuestionsState refreshSubjectQuestionsReducer(NewQuestionsState prev, RefreshSubjectQuestionsAction action) =>
  prev.startNextSubjectQuestions(action.subjectId);
NewQuestionsState refreshSubjectQuestionsSuccessReducer(NewQuestionsState prev, RefreshSubjectQuestionsSuccessAction action) =>
  prev.refreshSubjectQuestions(action.subjectId, action.questions);
NewQuestionsState refreshSubjectQuestionsFailedReducer(NewQuestionsState prev, RefreshSubjectQuestionsFailedAction action) =>
  prev.stopNextSubjectQuestions(action.subjectId);
//subject questions

//topic questions
NewQuestionsState nextTopicQuestionsReducer(NewQuestionsState prev, NextTopicQuestionsAction action) =>
  prev.startNextTopicQuestions(action.topicId);
NewQuestionsState nextTopicQuestionsSuccessReducer(NewQuestionsState prev, NextTopicQuestionsSuccessAction action) =>
  prev.addNextTopicQuestions(action.topicId, action.questions);
NewQuestionsState nextTopicQuestionsFailedReducer(NewQuestionsState prev, NextTopicQuestionsFailedAction action) =>
  prev.stopNextTopicQuestions(action.topicId);

NewQuestionsState refreshTopicQuestionsReducer(NewQuestionsState prev, RefreshTopicQuestionsAction action) =>
  prev.startNextTopicQuestions(action.topicId);
NewQuestionsState refreshTopicQuestionsSuccessReducer(NewQuestionsState prev, RefreshTopicQuestionsSuccessAction action) =>
  prev.refreshTopicQuestions(action.topicId, action.questions);
NewQuestionsState refreshTopicQuestionsFailedReducer(NewQuestionsState prev, RefreshTopicQuestionsFailedAction action) =>
  prev.stopNextTopicQuestions(action.topicId);
//topic questions

Reducer<NewQuestionsState> newQuestionsReducer = combineReducers<NewQuestionsState>([
  //questions
  TypedReducer<NewQuestionsState, CreateQuestionSuccessAction>(createQuestionSuccessReducer).call,
  TypedReducer<NewQuestionsState, LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<NewQuestionsState, DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  //questions

  //home questions
  TypedReducer<NewQuestionsState, NextHomeQuestionsAction>(nextHomeQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextHomeQuestionsSuccessAction>(nextHomeQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextHomeQuestionsFailedAction>(nextHomeQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshHomeQuestionsAction>(refreshHomeQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshHomeQuestionsSuccessAction>(refreshHomeQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshHomeQuestionsFailedAction>(refreshHomeQuestionsFailedReducer).call,
  //home questions

  //search questions
  TypedReducer<NewQuestionsState, NextSearchPageQuestionsAction>(nextSearchPageQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextSearchPageQuestionsSuccessAction>(nextSearchPageQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextSearchPageQuestionsFailedAction>(nextSearchPageQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshSearchPageQuestionsAction>(refreshSearchPageQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshSearchPageQuestionsSuccessAction>(refreshSearchPageQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshSearchPageQuestionsFailedAction>(refreshSearchPageQuestionsFailedReducer).call,
  //search questions

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

  //exam questions
  TypedReducer<NewQuestionsState, NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //exam questions

  //exam questions
  TypedReducer<NewQuestionsState, NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //exam questions

  //subject questions
  TypedReducer<NewQuestionsState, NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshSubjectQuestionsAction>(refreshSubjectQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshSubjectQuestionsSuccessAction>(refreshSubjectQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshSubjectQuestionsFailedAction>(refreshSubjectQuestionsFailedReducer).call,
  //subject questions

  //topic questions
  TypedReducer<NewQuestionsState, NextTopicQuestionsAction>(nextTopicQuestionsReducer).call,
  TypedReducer<NewQuestionsState, NextTopicQuestionsSuccessAction>(nextTopicQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, NextTopicQuestionsFailedAction>(nextTopicQuestionsFailedReducer).call,

  TypedReducer<NewQuestionsState, RefreshTopicQuestionsAction>(refreshTopicQuestionsReducer).call,
  TypedReducer<NewQuestionsState, RefreshTopicQuestionsSuccessAction>(refreshTopicQuestionsSuccessReducer).call,
  TypedReducer<NewQuestionsState, RefreshTopicQuestionsFailedAction>(refreshTopicQuestionsFailedReducer).call,
  //topic questions
]);