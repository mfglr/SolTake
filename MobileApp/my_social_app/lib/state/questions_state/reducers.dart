import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/questions_state.dart';
import 'package:my_social_app/state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:redux/redux.dart';

//loading
QuestionsState loadQuestionReducer(QuestionsState prev, LoadQuestionAction action) =>
  prev.load(action.questionId);
QuestionsState loadQuestionSuccessReducer(QuestionsState prev, LoadQuestionSuccessAction action) =>
  prev.loadSuccess(action.question);
QuestionsState loadQuestionFailedReducer(QuestionsState prev, LoadQuestionFailedAction action) =>
  prev.failed(action.questionId);
QuestionsState questionNotFoundReducer(QuestionsState prev, QuestionNotFoundAction action) =>
  prev.notFound(action.questionId);
//loading

//uploading
QuestionsState uploadQuestionReducer(QuestionsState prev, UploadQuestionAction action)
  => prev.upload(action.question);
QuestionsState changeQuestionRateReducer(QuestionsState prev, ChangeQuestionRateAction action)
  => prev.changeRate(action.questionId, action.rate);
QuestionsState markQuestionStatusAsProcessingReducer(QuestionsState prev, MarkQuestionStatusAsProcessing action)
  => prev.processing(action.questionId);
QuestionsState uploadQuestionSuccessReducer(QuestionsState prev, UploadQuestionSuccessAction action)
  => prev.uploadSuccess(action.question,action.serverId);
QuestionsState uploadQuestionFailedReducer(QuestionsState prev, UploadQuestionFailedAction action)
  => prev.uploadFailed(action.questionId);
//uploading

QuestionsState deleteQuestionSuccessReducer(QuestionsState prev, DeleteQuestionSuccessAction action)
  => prev.delete(action.question);
QuestionsState likeQuestionSuccessReducer(QuestionsState prev, LikeQuestionSuccessAction action)
  => prev.like(action.question);
QuestionsState dislikeQuestionSuccessReducer(QuestionsState prev, DislikeQuestionSuccessAction action)
  => prev.dislike(action.question);
//questions

//solutions
QuestionsState createSolutionSuccessReducer(QuestionsState prev, CreateSolutionSuccessAction action) =>
  prev.createSolution(action.solution);
QuestionsState deleteSolutionSuccessReducer(QuestionsState prev, DeleteSolutionSuccessAction action) =>
  prev.deleteSolution(action.solution);
//solutions

//home questions
QuestionsState nextHomeQuestionsReducer(QuestionsState prev, NextHomeQuestionsAction action) =>
  prev.startNextHomeQuestions();
QuestionsState nextHomeQuestionsSuccessReducer(QuestionsState prev, NextHomeQuestionsSuccessAction action) =>
  prev.addNextHomeQuestions(action.questions);
QuestionsState nextHomeQuestionsFailedReducer(QuestionsState prev, NextHomeQuestionsFailedAction action) =>
  prev.stopNextHomeQuestions();

QuestionsState refreshHomeQuestionsReducer(QuestionsState prev, RefreshHomeQuestionsAction action) =>
  prev.startNextHomeQuestions();
QuestionsState refreshHomeQuestionsSuccessReducer(QuestionsState prev, RefreshHomeQuestionsSuccessAction action) =>
  prev.refreshHomeQuestions(action.questions);
QuestionsState refreshHomeQuestionsFailedReducer(QuestionsState prev, RefreshHomeQuestionsFailedAction action) =>
  prev.stopNextHomeQuestions();
//home questions

//search questions
QuestionsState nextSearchPageQuestionsReducer(QuestionsState prev, NextSearchPageQuestionsAction action) =>
  prev.startNextSearchQuestions();
QuestionsState nextSearchPageQuestionsSuccessReducer(QuestionsState prev, NextSearchPageQuestionsSuccessAction action) =>
  prev.addNextSearchQuestions(action.questions);
QuestionsState nextSearchPageQuestionsFailedReducer(QuestionsState prev, NextSearchPageQuestionsFailedAction action) =>
  prev.stopNextSearchQuestions();

QuestionsState refreshSearchPageQuestionsReducer(QuestionsState prev, RefreshSearchPageQuestionsAction action) =>
  prev.startNextSearchQuestions();
QuestionsState refreshSearchPageQuestionsSuccessReducer(QuestionsState prev, RefreshSearchPageQuestionsSuccessAction action) =>
  prev.refreshSearchQuestions(action.questions);
QuestionsState refreshSearchPageQuestionsFailedReducer(QuestionsState prev, RefreshSearchPageQuestionsFailedAction action) =>
  prev.stopNextSearchQuestions();
//search questions

//video questions
QuestionsState nextVideoQuestionsReducer(QuestionsState prev, NextVideoQuestionsAction action) =>
  prev.startNextVideoQuestions();
QuestionsState nextVideoQuestionsSuccessReducer(QuestionsState prev, NextVideoQuestionsSuccessAction action) =>
  prev.addNextVideoQuestions(action.questions);
QuestionsState nextVideoQuestionsFailedReducer(QuestionsState prev, NextVideoQuestionsFailedAction action) =>
  prev.stopNextVideoQuestions();

QuestionsState refreshVideoQuestionsReducer(QuestionsState prev, RefreshVideoQuestionsAction action) =>
  prev.startNextVideoQuestions();
QuestionsState refreshVideoQuestionsSuccessReducer(QuestionsState prev, RefreshVideoQuestionsSuccessAction action) =>
  prev.refreshVideoQuestions(action.questions);
QuestionsState refreshVideoQuestionsFailedReducer(QuestionsState prev, RefreshVideoQuestionsFailedAction action) =>
  prev.stopNextVideoQuestions();
//video questions

//user questions
QuestionsState nextUserQuestionsReducer(QuestionsState prev, NextUserQuestionsAction action) =>
  prev.startNextUserQuestions(action.userId);
QuestionsState nextUserQuestionsSuccessReducer(QuestionsState prev, NextUserQuestionsSuccessAction action) =>
  prev.addNextUserQuestions(action.userId, action.questions);
QuestionsState nextUserQuestionsFailedReducer(QuestionsState prev, NextUserQuestionsFailedAction action) =>
  prev.stopNextUserQuestions(action.userId);

QuestionsState refreshUserQuestionsReducer(QuestionsState prev, RefreshUserQuestionsAction action) =>
  prev.startNextUserQuestions(action.userId);
QuestionsState refreshUserQuestionsSuccessReducer(QuestionsState prev, RefreshUserQuestionsSuccessAction action) =>
  prev.refreshUserQuestions(action.userId, action.questions);
QuestionsState refreshUserQuestionsFailedReducer(QuestionsState prev, RefreshUserQuestionsFailedAction action) =>
  prev.stopNextUserQuestions(action.userId);
//user questions

//user solved questions
QuestionsState nextUserSolvedQuestionsReducer(QuestionsState prev, NextUserSolvedQuestionsAction action) =>
  prev.startNextUserSolvedQuestions(action.userId);
QuestionsState nextUserSolvedQuestionsSuccessReducer(QuestionsState prev, NextUserSolvedQuestionsSuccessAction action) =>
  prev.addNextUserSolvedQuestions(action.userId, action.questions);
QuestionsState nextUserSolvedQuestionsFailedReducer(QuestionsState prev, NextUserSolvedQuestionsFailedAction action) =>
  prev.stopNextUserSolvedQuestions(action.userId);

QuestionsState refreshUserSolvedQuestionsReducer(QuestionsState prev, RefreshUserSolvedQuestionsAction action) =>
  prev.startNextUserSolvedQuestions(action.userId);
QuestionsState refreshUserSolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserSolvedQuestionsSuccessAction action) =>
  prev.refreshUserSolvedQuestions(action.userId, action.questions);
QuestionsState refreshUserSolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserSolvedQuestionsFailedAction action) =>
  prev.stopNextUserSolvedQuestions(action.userId);
//user solved questions

//user unsolved questions
QuestionsState nextUserUnsolvedQuestionsReducer(QuestionsState prev, NextUserUnsolvedQuestionsAction action) =>
  prev.startNextUserUnsolvedQuestions(action.userId);
QuestionsState nextUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, NextUserUnsolvedQuestionsSuccessAction action) =>
  prev.addNextUserUnsolvedQuestions(action.userId, action.questions);
QuestionsState nextUserUnsolvedQuestionsFailedReducer(QuestionsState prev, NextUserUnsolvedQuestionsFailedAction action) =>
  prev.stopNextUserUnsolvedQuestions(action.userId);

QuestionsState refreshUserUnsolvedQuestionsReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsAction action) =>
  prev.startNextUserUnsolvedQuestions(action.userId);
QuestionsState refreshUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsSuccessAction action) =>
  prev.refreshUserUnsolvedQuestions(action.userId, action.questions);
QuestionsState refreshUserUnsolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsFailedAction action) =>
  prev.stopNextUserUnsolvedQuestions(action.userId);
//user unsolved questions

//exam questions
QuestionsState nextExamQuestionsReducer(QuestionsState prev, NextExamQuestionsAction action) =>
  prev.startNextExamQuestions(action.examId);
QuestionsState nextExamQuestionsSuccessReducer(QuestionsState prev, NextExamQuestionsSuccessAction action) =>
  prev.addNextExamQuestions(action.examId, action.questions);
QuestionsState nextExamQuestionsFailedReducer(QuestionsState prev, NextExamQuestionsFailedAction action) =>
  prev.stopNextExamQuestions(action.examId);

QuestionsState refreshExamQuestionsReducer(QuestionsState prev, RefreshExamQuestionsAction action) =>
  prev.startNextExamQuestions(action.examId);
QuestionsState refreshExamQuestionsSuccessReducer(QuestionsState prev, RefreshExamQuestionsSuccessAction action) =>
  prev.refreshExamQuestions(action.examId, action.questions);
QuestionsState refreshExamQuestionsFailedReducer(QuestionsState prev, RefreshExamQuestionsFailedAction action) =>
  prev.stopNextExamQuestions(action.examId);
//exam questions

//subject questions
QuestionsState nextSubjectQuestionsReducer(QuestionsState prev, NextSubjectQuestionsAction action) =>
  prev.startNextSubjectQuestions(action.subjectId);
QuestionsState nextSubjectQuestionsSuccessReducer(QuestionsState prev, NextSubjectQuestionsSuccessAction action) =>
  prev.addNextSubjectQuestions(action.subjectId, action.questions);
QuestionsState nextSubjectQuestionsFailedReducer(QuestionsState prev, NextSubjectQuestionsFailedAction action) =>
  prev.stopNextSubjectQuestions(action.subjectId);

QuestionsState refreshSubjectQuestionsReducer(QuestionsState prev, RefreshSubjectQuestionsAction action) =>
  prev.startNextSubjectQuestions(action.subjectId);
QuestionsState refreshSubjectQuestionsSuccessReducer(QuestionsState prev, RefreshSubjectQuestionsSuccessAction action) =>
  prev.refreshSubjectQuestions(action.subjectId, action.questions);
QuestionsState refreshSubjectQuestionsFailedReducer(QuestionsState prev, RefreshSubjectQuestionsFailedAction action) =>
  prev.stopNextSubjectQuestions(action.subjectId);
//subject questions

//topic questions
QuestionsState nextTopicQuestionsReducer(QuestionsState prev, NextTopicQuestionsAction action) =>
  prev.startNextTopicQuestions(action.topicId);
QuestionsState nextTopicQuestionsSuccessReducer(QuestionsState prev, NextTopicQuestionsSuccessAction action) =>
  prev.addNextTopicQuestions(action.topicId, action.questions);
QuestionsState nextTopicQuestionsFailedReducer(QuestionsState prev, NextTopicQuestionsFailedAction action) =>
  prev.stopNextTopicQuestions(action.topicId);

QuestionsState refreshTopicQuestionsReducer(QuestionsState prev, RefreshTopicQuestionsAction action) =>
  prev.startNextTopicQuestions(action.topicId);
QuestionsState refreshTopicQuestionsSuccessReducer(QuestionsState prev, RefreshTopicQuestionsSuccessAction action) =>
  prev.refreshTopicQuestions(action.topicId, action.questions);
QuestionsState refreshTopicQuestionsFailedReducer(QuestionsState prev, RefreshTopicQuestionsFailedAction action) =>
  prev.stopNextTopicQuestions(action.topicId);
//topic questions

Reducer<QuestionsState> newQuestionsReducer = combineReducers<QuestionsState>([
  //loading
  TypedReducer<QuestionsState, LoadQuestionAction>(loadQuestionReducer).call,
  TypedReducer<QuestionsState, LoadQuestionSuccessAction>(loadQuestionSuccessReducer).call,
  TypedReducer<QuestionsState, LoadQuestionFailedAction>(loadQuestionFailedReducer).call,
  TypedReducer<QuestionsState, QuestionNotFoundAction>(questionNotFoundReducer).call,
  //loading

  //uploading
  TypedReducer<QuestionsState, UploadQuestionAction>(uploadQuestionReducer).call,
  TypedReducer<QuestionsState, ChangeQuestionRateAction>(changeQuestionRateReducer).call,
  TypedReducer<QuestionsState, MarkQuestionStatusAsProcessing>(markQuestionStatusAsProcessingReducer).call,
  TypedReducer<QuestionsState, UploadQuestionSuccessAction>(uploadQuestionSuccessReducer).call,
  TypedReducer<QuestionsState, UploadQuestionFailedAction>(uploadQuestionFailedReducer).call,
  //uploading

  TypedReducer<QuestionsState, DeleteQuestionSuccessAction>(deleteQuestionSuccessReducer).call,
  TypedReducer<QuestionsState, LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionsState, DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  //questions

  //solutions
  TypedReducer<QuestionsState, CreateSolutionSuccessAction>(createSolutionSuccessReducer).call,
  TypedReducer<QuestionsState, DeleteSolutionSuccessAction>(deleteSolutionSuccessReducer).call,
  //solutions

  //home questions
  TypedReducer<QuestionsState, NextHomeQuestionsAction>(nextHomeQuestionsReducer).call,
  TypedReducer<QuestionsState, NextHomeQuestionsSuccessAction>(nextHomeQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextHomeQuestionsFailedAction>(nextHomeQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshHomeQuestionsAction>(refreshHomeQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshHomeQuestionsSuccessAction>(refreshHomeQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshHomeQuestionsFailedAction>(refreshHomeQuestionsFailedReducer).call,
  //home questions

  //search questions
  TypedReducer<QuestionsState, NextSearchPageQuestionsAction>(nextSearchPageQuestionsReducer).call,
  TypedReducer<QuestionsState, NextSearchPageQuestionsSuccessAction>(nextSearchPageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextSearchPageQuestionsFailedAction>(nextSearchPageQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshSearchPageQuestionsAction>(refreshSearchPageQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshSearchPageQuestionsSuccessAction>(refreshSearchPageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshSearchPageQuestionsFailedAction>(refreshSearchPageQuestionsFailedReducer).call,
  //search questions

  //video questions
  TypedReducer<QuestionsState, NextVideoQuestionsAction>(nextVideoQuestionsReducer).call,
  TypedReducer<QuestionsState, NextVideoQuestionsSuccessAction>(nextVideoQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextVideoQuestionsFailedAction>(nextVideoQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshVideoQuestionsAction>(refreshVideoQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshVideoQuestionsSuccessAction>(refreshVideoQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshVideoQuestionsFailedAction>(refreshVideoQuestionsFailedReducer).call,
  //video questions

  //user questions
  TypedReducer<QuestionsState, NextUserQuestionsAction>(nextUserQuestionsReducer).call,
  TypedReducer<QuestionsState, NextUserQuestionsSuccessAction>(nextUserQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextUserQuestionsFailedAction>(nextUserQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshUserQuestionsAction>(refreshUserQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshUserQuestionsSuccessAction>(refreshUserQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshUserQuestionsFailedAction>(refreshUserQuestionsFailedReducer).call,
  //user questions

  //user solved questions
  TypedReducer<QuestionsState, NextUserSolvedQuestionsAction>(nextUserSolvedQuestionsReducer).call,
  TypedReducer<QuestionsState, NextUserSolvedQuestionsSuccessAction>(nextUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextUserSolvedQuestionsFailedAction>(nextUserSolvedQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshUserSolvedQuestionsAction>(refreshUserSolvedQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshUserSolvedQuestionsSuccessAction>(refreshUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshUserSolvedQuestionsFailedAction>(refreshUserSolvedQuestionsFailedReducer).call,
  //user solved questions

  //user unsolved questions
  TypedReducer<QuestionsState, NextUserUnsolvedQuestionsAction>(nextUserUnsolvedQuestionsReducer).call,
  TypedReducer<QuestionsState, NextUserUnsolvedQuestionsSuccessAction>(nextUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextUserUnsolvedQuestionsFailedAction>(nextUserUnsolvedQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshUserUnsolvedQuestionsAction>(refreshUserUnsolvedQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshUserUnsolvedQuestionsSuccessAction>(refreshUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshUserUnsolvedQuestionsFailedAction>(refreshUserUnsolvedQuestionsFailedReducer).call,
  //user unsolved questions

  //exam questions
  TypedReducer<QuestionsState, NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<QuestionsState, NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //exam questions

  //exam questions
  TypedReducer<QuestionsState, NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<QuestionsState, NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //exam questions

  //subject questions
  TypedReducer<QuestionsState, NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<QuestionsState, NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshSubjectQuestionsAction>(refreshSubjectQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshSubjectQuestionsSuccessAction>(refreshSubjectQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshSubjectQuestionsFailedAction>(refreshSubjectQuestionsFailedReducer).call,
  //subject questions

  //topic questions
  TypedReducer<QuestionsState, NextTopicQuestionsAction>(nextTopicQuestionsReducer).call,
  TypedReducer<QuestionsState, NextTopicQuestionsSuccessAction>(nextTopicQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, NextTopicQuestionsFailedAction>(nextTopicQuestionsFailedReducer).call,

  TypedReducer<QuestionsState, RefreshTopicQuestionsAction>(refreshTopicQuestionsReducer).call,
  TypedReducer<QuestionsState, RefreshTopicQuestionsSuccessAction>(refreshTopicQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState, RefreshTopicQuestionsFailedAction>(refreshTopicQuestionsFailedReducer).call,
  //topic questions
]);