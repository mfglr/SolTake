import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/search_page_state/actions.dart';
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

//search page state
QuestionsState nextSearchPageQuestionsReducer(QuestionsState prev, NextSearchPageQuestionsAction action) =>
  prev.startLoadingNextSearchPageQuestions();
QuestionsState nextSearchPageQuestionsSuccessReducer(QuestionsState prev, NextSearchPageQuestionsSuccessAction action) =>
  prev.addNextPageSearchPageQuestions(action.questions);
QuestionsState nextSearchPageQuestionsFailedReducer(QuestionsState prev, NextSearchPageQuestionsFailedAction action) =>
  prev.stopLoadingNextSearchPageQuestions();

QuestionsState refreshSearchPageQuestionsReducer(QuestionsState prev, RefreshSearchPageQuestionsAction action) =>
  prev.startLoadingNextSearchPageQuestions();
QuestionsState refreshSearchPageQuestionsSuccessReducer(QuestionsState prev, RefreshSearchPageQuestionsSuccessAction action) =>
  prev.refreshSearchPageQuestions(action.questions);
QuestionsState refreshSearchPageQuestionsFailedReducer(QuestionsState prev, RefreshSearchPageQuestionsFailedAction action) =>
  prev.stopLoadingNextSearchPageQuestions();

QuestionsState changeExamReducer(QuestionsState prev, ChangeExamAction action) =>
  prev.startLoadingNextSearchPageQuestions();
QuestionsState changeSubjectReducer(QuestionsState prev, ChangeSubjectAction action) =>
  prev.startLoadingNextSearchPageQuestions();
QuestionsState changeTopicReducer(QuestionsState prev, ChangeTopicAction action) =>
  prev.startLoadingNextSearchPageQuestions();
//search page state



//solutions action
QuestionsState createSolutionSuccessReducer(QuestionsState prev, CreateSolutionSuccessAction action)
  => prev.createSolution(action.question, action.solution);
QuestionsState deleteSolutionSuccessReducer(QuestionsState prev, DeleteSolutionSuccessAction action)
  => prev.deleteSolution(action.question, action.solution);
//solutions action

//question user likes
QuestionsState nextQuestionUserLikesReducer(QuestionsState prev, NextQuestionUserLikesAction action)
  => prev.startLoadingNextQuestionUserLikes(action.questionId);
QuestionsState nextQuestionUserLikesSuccessReducer(QuestionsState prev, NextQuestionUserLikesSuccessAction action)
  => prev.addNextPageQuestionUserLikes(action.questionId, action.questionUserLikes);
QuestionsState nextQuestionUserLikesFailedReducer(QuestionsState prev, NextQuestionUserLikesFailedAction action)
  => prev.stopLoadingNextQuestionUserLikes(action.questionId);

QuestionsState refreshQuestionUserLikesReducer(QuestionsState prev, RefreshQuestionUserLikesAction action)
  => prev.startLoadingNextQuestionUserLikes(action.questionId);
QuestionsState refreshQuestionUserLikesSuccessReducer(QuestionsState prev, RefreshQuestionUserLikesSuccessAction action)
  => prev.refreshQuestionUserLikes(action.questionId, action.questionUserLikes);
QuestionsState refreshQuestionUserLikesFailedReducer(QuestionsState prev, RefreshQuestionUserLikesFailedAction action)
  => prev.stopLoadingNextQuestionUserLikes(action.questionId);

QuestionsState likeQuestionSuccessReducer(QuestionsState prev, LikeQuestionSuccessAction action)
  => prev.like(action.question, action.questionUserLike);
QuestionsState dislikeQuestionSuccessReducer(QuestionsState prev, DislikeQuestionSuccessAction action)
  => prev.dislike(action.question, action.userId);
//question user likes

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

// subject questions
QuestionsState nextSubjectQuestionsReducer(QuestionsState prev, NextSubjectQuestionsAction action)
  => prev.startLoadingNextSubjectQuestions(action.subjectId);
QuestionsState nextSubjectQuestionsSuccessReducer(QuestionsState prev, NextSubjectQuestionsSuccessAction action)
  => prev.addNextPageSubjectQuestions(action.subjectId, action.questions);
QuestionsState nextSubjectQuestionsFailedReducer(QuestionsState prev, NextSubjectQuestionsFailedAction action)
  => prev.stopLoadingNextSubjectQuestions(action.subjectId);

QuestionsState refreshSubjectQuestionsReducer(QuestionsState prev, RefreshSubjectQuestionsAction action)
  => prev.startLoadingNextSubjectQuestions(action.subjectId);
QuestionsState refreshSubjectQuestionsSuccessReducer(QuestionsState prev, RefreshSubjectQuestionsSuccessAction action)
  => prev.refreshSubjectQuestions(action.subjectId, action.questions);
QuestionsState refreshSubjectQuestionsFailedReducer(QuestionsState prev, RefreshSubjectQuestionsFailedAction action)
  => prev.stopLoadingNextSubjectQuestions(action.subjectId);
// Subject questions

// topic questions
QuestionsState nextTopicQuestionsReducer(QuestionsState prev, NextTopicQuestionsAction action)
  => prev.startLoadingNextTopicQuestions(action.topicId);
QuestionsState nextTopicQuestionsSuccessReducer(QuestionsState prev, NextTopicQuestionsSuccessAction action)
  => prev.addNextPageTopicQuestions(action.topicId, action.questions);
QuestionsState nextTopicQuestionsFailedReducer(QuestionsState prev, NextTopicQuestionsFailedAction action)
  => prev.stopLoadingNextTopicQuestions(action.topicId);

QuestionsState refreshTopicQuestionsReducer(QuestionsState prev, RefreshTopicQuestionsAction action)
  => prev.startLoadingNextTopicQuestions(action.topicId);
QuestionsState refreshTopicQuestionsSuccessReducer(QuestionsState prev, RefreshTopicQuestionsSuccessAction action)
  => prev.refreshTopicQuestions(action.topicId, action.questions);
QuestionsState refreshTopicQuestionsFailedReducer(QuestionsState prev, RefreshTopicQuestionsFailedAction action)
  => prev.stopLoadingNextTopicQuestions(action.topicId);
//topic questions

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
  
  //question user likes
  TypedReducer<QuestionsState,NextQuestionUserLikesAction>(nextQuestionUserLikesReducer).call,
  TypedReducer<QuestionsState,NextQuestionUserLikesSuccessAction>(nextQuestionUserLikesSuccessReducer).call,
  TypedReducer<QuestionsState,NextQuestionUserLikesFailedAction>(nextQuestionUserLikesFailedReducer).call,

  TypedReducer<QuestionsState,RefreshQuestionUserLikesAction>(refreshQuestionUserLikesReducer).call,
  TypedReducer<QuestionsState,RefreshQuestionUserLikesSuccessAction>(refreshQuestionUserLikesSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshQuestionUserLikesFailedAction>(refreshQuestionUserLikesFailedReducer).call,

  TypedReducer<QuestionsState,LikeQuestionSuccessAction>(likeQuestionSuccessReducer).call,
  TypedReducer<QuestionsState,DislikeQuestionSuccessAction>(dislikeQuestionSuccessReducer).call,
  //question user likes

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

  // search page questions
  TypedReducer<QuestionsState,NextSearchPageQuestionsAction>(nextSearchPageQuestionsReducer).call,
  TypedReducer<QuestionsState,NextSearchPageQuestionsSuccessAction>(nextSearchPageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextSearchPageQuestionsFailedAction>(nextSearchPageQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshSearchPageQuestionsAction>(refreshSearchPageQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshSearchPageQuestionsSuccessAction>(refreshSearchPageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshSearchPageQuestionsFailedAction>(refreshSearchPageQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,ChangeExamAction>(changeExamReducer).call,
  TypedReducer<QuestionsState,ChangeSubjectAction>(changeSubjectReducer).call,
  TypedReducer<QuestionsState,ChangeTopicAction>(changeTopicReducer).call,
  // search page questions

  //subject questions
  TypedReducer<QuestionsState,NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<QuestionsState,NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshSubjectQuestionsAction>(refreshSubjectQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshSubjectQuestionsSuccessAction>(refreshSubjectQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshSubjectQuestionsFailedAction>(refreshSubjectQuestionsFailedReducer).call,
  //subject questions

  //topic questions
  TypedReducer<QuestionsState,NextTopicQuestionsAction>(nextTopicQuestionsReducer).call,
  TypedReducer<QuestionsState,NextTopicQuestionsSuccessAction>(nextTopicQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextTopicQuestionsFailedAction>(nextTopicQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshTopicQuestionsAction>(refreshTopicQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshTopicQuestionsSuccessAction>(refreshTopicQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshTopicQuestionsFailedAction>(refreshTopicQuestionsFailedReducer).call,
  //topic questions

]);
