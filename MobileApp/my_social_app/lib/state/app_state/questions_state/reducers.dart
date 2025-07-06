import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/questions_state.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

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
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateElsePrependOne(
        action.userId,
        (prev.userQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextUserQuestionsSuccessReducer(QuestionsState prev, NextUserQuestionsSuccessAction action)
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateOne(
        action.userId,
        prev.userQuestions[action.userId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextUserQuestionsFailedReducer(QuestionsState prev, NextUserQuestionsFailedAction action)
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateOne(
        action.userId,
        prev.userQuestions[action.userId]!.stopLoadingNext()
      )
    );

QuestionsState refreshUserQuestionsReducer(QuestionsState prev, RefreshUserQuestionsAction action)
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateElsePrependOne(
        action.userId,
        (prev.userQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshUserQuestionsSuccessReducer(QuestionsState prev, RefreshUserQuestionsSuccessAction action)
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateOne(
        action.userId,
        prev.userQuestions[action.userId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshUserQuestionsFailedReducer(QuestionsState prev, RefreshUserQuestionsFailedAction action)
  => prev.optional(
      newUserQuestions: prev.userQuestions.updateOne(
        action.userId,
        prev.userQuestions[action.userId]!.stopLoadingNext()
      )
    );
// user questions


// user solved questions
QuestionsState nextUserSolvedQuestionsReducer(QuestionsState prev, NextUserSolvedQuestionsAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateElsePrependOne(
        action.userId,
        (prev.userSolvedQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextUserSolvedQuestionsSuccessReducer(QuestionsState prev, NextUserSolvedQuestionsSuccessAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateOne(
        action.userId,
        prev.userSolvedQuestions[action.userId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextUserSolvedQuestionsFailedReducer(QuestionsState prev, NextUserSolvedQuestionsFailedAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateOne(
        action.userId,
        prev.userSolvedQuestions[action.userId]!.stopLoadingNext()
      )
    );

QuestionsState refreshUserSolvedQuestionsReducer(QuestionsState prev, RefreshUserSolvedQuestionsAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateElsePrependOne(
        action.userId,
        (prev.userSolvedQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshUserSolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserSolvedQuestionsSuccessAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateOne(
        action.userId,
        prev.userSolvedQuestions[action.userId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshUserSolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserSolvedQuestionsFailedAction action)
  => prev.optional(
      newUserSolvedQuestions: prev.userSolvedQuestions.updateOne(
        action.userId,
        prev.userSolvedQuestions[action.userId]!.stopLoadingNext()
      )
    );
// user solved questions

// user unsolved questions
QuestionsState nextUserUnsolvedQuestionsReducer(QuestionsState prev, NextUserUnsolvedQuestionsAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateElsePrependOne(
        action.userId,
        (prev.userUnsolvedQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, NextUserUnsolvedQuestionsSuccessAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateOne(
        action.userId,
        prev.userUnsolvedQuestions[action.userId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextUserUnsolvedQuestionsFailedReducer(QuestionsState prev, NextUserUnsolvedQuestionsFailedAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateOne(
        action.userId,
        prev.userUnsolvedQuestions[action.userId]!.stopLoadingNext()
      )
    );

QuestionsState refreshUserUnsolvedQuestionsReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateElsePrependOne(
        action.userId,
        (prev.userUnsolvedQuestions[action.userId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshUserUnsolvedQuestionsSuccessReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsSuccessAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateOne(
        action.userId,
        prev.userUnsolvedQuestions[action.userId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshUserUnsolvedQuestionsFailedReducer(QuestionsState prev, RefreshUserUnsolvedQuestionsFailedAction action)
  => prev.optional(
      newUserUnsolvedQuestions: prev.userUnsolvedQuestions.updateOne(
        action.userId,
        prev.userUnsolvedQuestions[action.userId]!.stopLoadingNext()
      )
    );
// user unsolved questions

// exam questions
QuestionsState nextExamQuestionsReducer(QuestionsState prev, NextExamQuestionsAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateElsePrependOne(
        action.examId,
        (prev.examQuestions[action.examId] ?? Pagination.init(questionsPerPage, true)).startLoadingNext()
      )
    );
QuestionsState nextExamQuestionsSuccessReducer(QuestionsState prev, NextExamQuestionsSuccessAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateOne(
        action.examId,
        prev.examQuestions[action.examId]!.addNextPage(action.questions)
      )
    );
QuestionsState nextExamQuestionsFailedReducer(QuestionsState prev, NextExamQuestionsFailedAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateOne(
        action.examId,
        prev.examQuestions[action.examId]!.stopLoadingNext()
      )
    );

QuestionsState refreshExamQuestionsReducer(QuestionsState prev, RefreshExamQuestionsAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateElsePrependOne(
        action.examId,
        (prev.examQuestions[action.examId] ?? Pagination.init(questionsPerPage, true)).clear().startLoadingNext()
      )
    );
QuestionsState refreshExamQuestionsSuccessReducer(QuestionsState prev, RefreshExamQuestionsSuccessAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateOne(
        action.examId,
        prev.examQuestions[action.examId]!.refreshPage(action.questions)
      )
    );
QuestionsState refreshExamQuestionsFailedReducer(QuestionsState prev, RefreshExamQuestionsFailedAction action)
  => prev.optional(
      newExamQuestions: prev.examQuestions.updateOne(
        action.examId,
        prev.examQuestions[action.examId]!.stopLoadingNext()
      )
    );
// exam questions

Reducer<QuestionsState> questionsReducers = combineReducers<QuestionsState>([
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

  //user unsolved questions
  TypedReducer<QuestionsState,NextExamQuestionsAction>(nextExamQuestionsReducer).call,
  TypedReducer<QuestionsState,NextExamQuestionsSuccessAction>(nextExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,NextExamQuestionsFailedAction>(nextExamQuestionsFailedReducer).call,

  TypedReducer<QuestionsState,RefreshExamQuestionsAction>(refreshExamQuestionsReducer).call,
  TypedReducer<QuestionsState,RefreshExamQuestionsSuccessAction>(refreshExamQuestionsSuccessReducer).call,
  TypedReducer<QuestionsState,RefreshExamQuestionsFailedAction>(refreshExamQuestionsFailedReducer).call,
  //user unsolved questions
]);
