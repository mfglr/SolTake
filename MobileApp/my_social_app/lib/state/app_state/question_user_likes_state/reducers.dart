import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_likes_state/question_user_likes_state.dart';
import 'package:redux/redux.dart';

//questions
QuestionUserLikesState deleteQuestionSuccessReducer(QuestionUserLikesState prev, DeleteQuestionSuccessAction action) =>
  prev.deleteQuestion(action.question);
//questions

QuestionUserLikesState likeSuccessReducer(QuestionUserLikesState prev, LikeQuestionSuccessAction action) =>
  prev.like(action.question.id, action.questionUserLike);
QuestionUserLikesState dislikeSuccessReducer(QuestionUserLikesState prev, DislikeQuestionSuccessAction action) =>
  prev.dislike(action.question.id, action.userId);

QuestionUserLikesState nextQuestionUserLikesReducer(QuestionUserLikesState prev, NextQuestionUserLikesAction action) =>
  prev.startNext(action.questionId);
QuestionUserLikesState nextQuestionUserLikesSuccessReducer(QuestionUserLikesState prev, NextQuestionUserLikesSuccessAction action) =>
  prev.addNext(action.questionId,action.questionUserLikes);
QuestionUserLikesState nextQuestionUserLikesFailedReducer(QuestionUserLikesState prev, NextQuestionUserLikesFailedAction action) =>
  prev.stopNext(action.questionId);

QuestionUserLikesState refreshQuestionUserLikesReducer(QuestionUserLikesState prev, RefreshQuestionUserLikesAction action) =>
  prev.startNext(action.questionId);
QuestionUserLikesState refreshQuestionUserLikesSuccessReducer(QuestionUserLikesState prev, RefreshQuestionUserLikesSuccessAction action) =>
  prev.refresh(action.questionId,action.questionUserLikes);
QuestionUserLikesState refreshQuestionUserLikesFailedReducer(QuestionUserLikesState prev,RefreshQuestionUserLikesFailedAction action) =>
  prev.stopNext(action.questionId);

Reducer<QuestionUserLikesState> questionUserLikes = combineReducers<QuestionUserLikesState>([
  //questions
  TypedReducer<QuestionUserLikesState, DeleteQuestionSuccessAction>(deleteQuestionSuccessReducer).call,
  //questions

  TypedReducer<QuestionUserLikesState,LikeQuestionSuccessAction>(likeSuccessReducer).call,
  TypedReducer<QuestionUserLikesState,DislikeQuestionSuccessAction>(dislikeSuccessReducer).call,

  TypedReducer<QuestionUserLikesState,NextQuestionUserLikesAction>(nextQuestionUserLikesReducer).call,
  TypedReducer<QuestionUserLikesState,NextQuestionUserLikesSuccessAction>(nextQuestionUserLikesSuccessReducer).call,
  TypedReducer<QuestionUserLikesState,NextQuestionUserLikesFailedAction>(nextQuestionUserLikesFailedReducer).call,
  
  TypedReducer<QuestionUserLikesState,RefreshQuestionUserLikesAction>(refreshQuestionUserLikesReducer).call,
  TypedReducer<QuestionUserLikesState,RefreshQuestionUserLikesSuccessAction>(refreshQuestionUserLikesSuccessReducer).call,
  TypedReducer<QuestionUserLikesState,RefreshQuestionUserLikesFailedAction>(refreshQuestionUserLikesFailedReducer).call,
]);