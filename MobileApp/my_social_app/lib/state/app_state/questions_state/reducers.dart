import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

//questions
QuestionsState createQuestionSuccessReducer(QuestionsState prev, CreateQuestionSuccessAction action) =>
  prev.create(action.question);
QuestionsState deleteQuestionSuccessReducer(QuestionsState prev, DeleteQuestionSuccessAction action) =>
  prev.delete(action.question);
QuestionsState markSolutionAsCorrectSuccessReducer(QuestionsState prev, MarkSolutionAsCorrectSuccessAction action) =>
  prev.markSolutionAsCorrect(action.question, action.solution);
QuestionsState markSolutionAsIncorrectSuccessReducer(QuestionsState prev, MarkSolutionAsIncorrectSuccessAction action) =>
  prev.markSolutionAsIncorrect(action.question, action.solution);
//questions

//comments action
QuestionsState createCommentSuccessReducer(QuestionsState prev, CreateCommentsSuccessAction action)
  => action.question == null ? prev : prev.increaseNumberOfComments(action.question!);
//coments action

//solutions action
QuestionsState createSolutionSuccessReducer(QuestionsState prev, CreateSolutionSuccessAction action)
  => prev.createSolution(action.question, action.solution);
QuestionsState deleteSolutionSuccessReducer(QuestionsState prev, DeleteSolutionSuccessAction action)
  => prev.deleteSolution(action.question, action.solution);
//solutions action

//question user likes
QuestionsState nextQuestionUserLikesReducer(QuestionsState prev, NextQuestionUserLikesAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateElsePrependOne(
          action.questionId,
          (prev.questionUserLikes[action.questionId] ?? Pagination.init(questionUserLikesPerPage, true)).startLoadingNext()
        )
      );
QuestionsState nextQuestionUserLikesSuccessReducer(QuestionsState prev, NextQuestionUserLikesSuccessAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateOne(
          action.questionId,
          prev.questionUserLikes[action.questionId]!.addNextPage(action.questionUserLikes)
        )
      );
QuestionsState nextQuestionUserLikesFailedReducer(QuestionsState prev, NextQuestionUserLikesFailedAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateOne(
          action.questionId,
          prev.questionUserLikes[action.questionId]!.stopLoadingNext()
        )
      );

QuestionsState refreshQuestionUserLikesReducer(QuestionsState prev, RefreshQuestionUserLikesAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateElsePrependOne(
          action.questionId,
          (prev.questionUserLikes[action.questionId] ?? Pagination.init(questionUserLikesPerPage, true)).clear().startLoadingNext()
        )
      );
QuestionsState refreshQuestionUserLikesSuccessReducer(QuestionsState prev, RefreshQuestionUserLikesSuccessAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateOne(
          action.questionId,
          prev.questionUserLikes[action.questionId]!.refreshPage(action.questionUserLikes)
        )
      );
QuestionsState refreshQuestionUserLikesFailedReducer(QuestionsState prev, RefreshQuestionUserLikesFailedAction action)
  => prev
      .optional(
        newQuestionUserLikes: prev.questionUserLikes.updateOne(
          action.questionId,
          prev.questionUserLikes[action.questionId]!.stopLoadingNext()
        )
      );

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


// home page questions
QuestionsState nextHomePageQuestionsReducer(QuestionsState prev, NextHomePageQuestionsAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.startLoadingNext());
QuestionsState nextHomePageQuestionsSuccessReducer(QuestionsState prev, NextHomePageQuestionsSuccessAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.addNextPage(action.questions));
QuestionsState nextHomePageQuestionsFailedReducer(QuestionsState prev, NextHomePageQuestionsFailedAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.stopLoadingNext());

QuestionsState refreshHomePageQuestionsReducer(QuestionsState prev, RefreshHomePageQuestionsAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.clear().startLoadingNext());
QuestionsState refreshHomePageQuestionsSuccessReducer(QuestionsState prev, RefreshHomePageQuestionsSuccessAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.refreshPage(action.questions));
QuestionsState refreshHomePageQuestionsFailedReducer(QuestionsState prev, RefreshHomePageQuestionsFailedAction action)
  => prev.optional(newHomePageQuestions: prev.homePageQuestions.stopLoadingNext());
// home page questions

// user questions
QuestionsState nextUserQuestionsReducer(QuestionsState prev, NextUserQuestionsAction action)
  => prev.startLoadingNextUserQuestions(action.userId);
QuestionsState nextUserQuestionsSuccessReducer(QuestionsState prev, NextUserQuestionsSuccessAction action)
  => prev.addNextPageUserQuestions(action.userId, action.questions);
QuestionsState nextUserQuestionsFailedReducer(QuestionsState prev, NextUserQuestionsFailedAction action)
  => prev.stopLoadingNextUserQuestions(action.userId);

QuestionsState refreshUserQuestionsReducer(QuestionsState prev, RefreshUserQuestionsAction action)
  => prev.startLoadingNextUserQuestions(action.userId);
QuestionsState refreshUserQuestionsSuccessReducer(QuestionsState prev, RefreshUserQuestionsSuccessAction action)
  => prev.refreshUserQuestions(action.userId, action.questions);
QuestionsState refreshUserQuestionsFailedReducer(QuestionsState prev, RefreshUserQuestionsFailedAction action)
  => prev.stopLoadingNextUserQuestions(action.userId);
// user questions


// user solved questions
QuestionsState nextUserSolvedQuestionsReducer(QuestionsState prev, NextUserSolvedQuestionsAction action)
  => prev.startLoadingNextUserSolvedQuestions(action.userId);
QuestionsState nextUserSolvedQuestionsSuccessReducer(QuestionsState prev, NextUserSolvedQuestionsSuccessAction action)
  => prev.addNextPageUserSolvedQuestions(action.userId, action.questions);
QuestionsState nextUserSolvedQuestionsFailedReducer(QuestionsState prev, NextUserSolvedQuestionsFailedAction action)
  => prev.stopLoadingNextUserSolvedQuestions(action.userId);

QuestionsState refreshUserSolvedQuestionsReducer(QuestionsState prev, RefreshUserSolvedQuestionsAction action)
  => prev.startLoadingNextUserSolvedQuestions(action.userId);
QuestionsState refreshUserSolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserSolvedQuestionsSuccessAction action)
  => prev.refreshUserSolvedQuestions(action.userId, action.questions);
QuestionsState refreshUserSolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserSolvedQuestionsFailedAction action)
  => prev.stopLoadingNextUserSolvedQuestions(action.userId);
// user solved questions

// user unsolved questions
QuestionsState nextUserUnsolvedQuestionsReducer(QuestionsState prev, NextUserUnsolvedQuestionsAction action)
  => prev.startLoadingNextUserUnsolvedQuestions(action.userId);
QuestionsState nextUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, NextUserUnsolvedQuestionsSuccessAction action)
  => prev.addNextPageUserUnsolvedQuestions(action.userId, action.questions);
QuestionsState nextUserUnsolvedQuestionsFailedReducer(QuestionsState prev, NextUserUnsolvedQuestionsFailedAction action)
  => prev.stopLoadingNextUserUnsolvedQuestions(action.userId);

QuestionsState refreshUserUnsolvedQuestionsReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsAction action)
  => prev.startLoadingNextUserUnsolvedQuestions(action.userId);
QuestionsState refreshUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsSuccessAction action)
  => prev.refreshUserUnsolvedQuestions(action.userId, action.questions);
QuestionsState refreshUserUnsolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsFailedAction action)
  => prev.stopLoadingNextUserUnsolvedQuestions(action.userId);
// user unsolved questions

// exam questions
QuestionsState nextExamQuestionsReducer(QuestionsState prev, NextExamQuestionsAction action)
  => prev.startLoadingNextExamQuestions(action.examId);
QuestionsState nextExamQuestionsSuccessReducer(QuestionsState prev, NextExamQuestionsSuccessAction action)
  => prev.addNextPageExamQustions(action.examId, action.questions);
QuestionsState nextExamQuestionsFailedReducer(QuestionsState prev, NextExamQuestionsFailedAction action)
  => prev.stopLoadingNextExamQuestions(action.examId);

QuestionsState refreshExamQuestionsReducer(QuestionsState prev, RefreshExamQuestionsAction action)
  => prev.startLoadingNextExamQuestions(action.examId);
QuestionsState refreshExamQuestionsSuccessReducer(QuestionsState prev, RefreshExamQuestionsSuccessAction action)
  => prev.refreshExamQuestions(action.examId, action.questions);
QuestionsState refreshExamQuestionsFailedReducer(QuestionsState prev, RefreshExamQuestionsFailedAction action)
  => prev.stopLoadingNextExamQuestions(action.examId);
// exam questions

// subject questions
QuestionsState nextSubjectQuestionsReducer(QuestionsState prev, NextSubjectQuestionsAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateElsePrependOne(
        action.subjectId,
        (prev.subjectQuestions[action.subjectId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextSubjectQuestionsSuccessReducer(QuestionsState prev, NextSubjectQuestionsSuccessAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateOne(
        action.subjectId,
        prev.subjectQuestions[action.subjectId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextSubjectQuestionsFailedReducer(QuestionsState prev, NextSubjectQuestionsFailedAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateOne(
        action.subjectId,
        prev.subjectQuestions[action.subjectId]!.stopLoadingNext()
      )
    );

QuestionsState refreshSubjectQuestionsReducer(QuestionsState prev, RefreshSubjectQuestionsAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateElsePrependOne(
        action.subjectId,
        (prev.subjectQuestions[action.subjectId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshSubjectQuestionsSuccessReducer(QuestionsState prev, RefreshSubjectQuestionsSuccessAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateOne(
        action.subjectId,
        prev.subjectQuestions[action.subjectId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshSubjectQuestionsFailedReducer(QuestionsState prev, RefreshSubjectQuestionsFailedAction action)
  => prev.optional(
      newSubjectQuestions: prev.subjectQuestions.updateOne(
        action.subjectId,
        prev.subjectQuestions[action.subjectId]!.stopLoadingNext()
      )
    );
// Subject questions

// topic questions
QuestionsState nextTopicQuestionsReducer(QuestionsState prev, NextTopicQuestionsAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateElsePrependOne(
        action.topicId,
        (prev.topicQuestions[action.topicId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextTopicQuestionsSuccessReducer(QuestionsState prev, NextTopicQuestionsSuccessAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateOne(
        action.topicId,
        prev.topicQuestions[action.topicId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextTopicQuestionsFailedReducer(QuestionsState prev, NextTopicQuestionsFailedAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateOne(
        action.topicId,
        prev.topicQuestions[action.topicId]!.stopLoadingNext()
      )
    );

QuestionsState refreshTopicQuestionsReducer(QuestionsState prev, RefreshTopicQuestionsAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateElsePrependOne(
        action.topicId,
        (prev.topicQuestions[action.topicId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshTopicQuestionsSuccessReducer(QuestionsState prev, RefreshTopicQuestionsSuccessAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateOne(
        action.topicId,
        prev.topicQuestions[action.topicId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshTopicQuestionsFailedReducer(QuestionsState prev, RefreshTopicQuestionsFailedAction action)
  => prev.optional(
      newTopicQuestions: prev.topicQuestions.updateOne(
        action.topicId,
        prev.topicQuestions[action.topicId]!.stopLoadingNext()
      )
    );
//topic questions

Reducer<QuestionsState> questionsReducers = combineReducers<QuestionsState>([
  //questions
  TypedReducer<QuestionsState,CreateQuestionSuccessAction>(createQuestionSuccessReducer).call,
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

  // home page questions
  TypedReducer<QuestionsState,NextHomePageQuestionsAction>(nextHomePageQuestionsReducer).call,
  TypedReducer<QuestionsState,NextHomePageQuestionsSuccessAction>(nextHomePageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextHomePageQuestionsFailedAction>(nextHomePageQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshHomePageQuestionsAction>(refreshHomePageQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshHomePageQuestionsSuccessAction>(refreshHomePageQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshHomePageQuestionsFailedAction>(refreshHomePageQuestionsFailedReducer).call,
  // home page questions

  //user questions
  TypedReducer<QuestionsState,NextUserQuestionsAction>(nextUserQuestionsReducer).call,
  TypedReducer<QuestionsState,NextUserQuestionsSuccessAction>(nextUserQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextUserQuestionsFailedAction>(nextUserQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshUserQuestionsAction>(refreshUserQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshUserQuestionsSuccessAction>(refreshUserQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshUserQuestionsFailedAction>(refreshUserQuestionsFailedReducer).call,
  //user questions
  
  //user solved questions
  TypedReducer<QuestionsState,NextUserSolvedQuestionsAction>(nextUserSolvedQuestionsReducer).call,
  TypedReducer<QuestionsState,NextUserSolvedQuestionsSuccessAction>(nextUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextUserSolvedQuestionsFailedAction>(nextUserSolvedQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshUserSolvedQuestionsAction>(refreshUserSolvedQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshUserSolvedQuestionsSuccessAction>(refreshUserSolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshUserSolvedQuestionsFailedAction>(refreshUserSolvedQuestionsFailedReducer).call,
  //user solved questions

  //user unsolved questions
  TypedReducer<QuestionsState,NextUserUnsolvedQuestionsAction>(nextUserUnsolvedQuestionsReducer).call,
  TypedReducer<QuestionsState,NextUserUnsolvedQuestionsSuccessAction>(nextUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextUserUnsolvedQuestionsFailedAction>(nextUserUnsolvedQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshUserUnsolvedQuestionsAction>(refreshUserUnsolvedQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshUserUnsolvedQuestionsSuccessAction>(refreshUserUnsolvedQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshUserUnsolvedQuestionsFailedAction>(refreshUserUnsolvedQuestionsFailedReducer).call,
  //user unsolved questions

  //exam questions
  TypedReducer<QuestionsState,NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<QuestionsState,NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //exam questions

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
