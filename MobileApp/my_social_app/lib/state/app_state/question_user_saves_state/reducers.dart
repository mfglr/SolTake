import 'package:my_social_app/state/app_state/question_user_saves_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,QuestionUserSaveState> createQuestionUserSaveSuccessReducer(Pagination<int,QuestionUserSaveState> prev,CreateQuestionUserSaveSuccessAction action)
  => prev.prependOne(action.questionUserSave);
Pagination<int, QuestionUserSaveState> deleteQuestionUserSaveFailedReducer(Pagination<int,QuestionUserSaveState> prev,DeleteQuestionUserSaveSuccesAction action)
  => prev.where((e) => e.questionId != action.questionId);

Pagination<int, QuestionUserSaveState> nextQuestionUserSavesReducer(Pagination<int,QuestionUserSaveState> prev,NextQuestionUserSavesAction action)
  => prev.startLoadingNext();
Pagination<int,QuestionUserSaveState> nextQuestionUserSavesSuccessReducer(Pagination<int,QuestionUserSaveState> prev, NextQuestionUserSavesSuccessAction action)
  => prev.addNextPage(action.questionUserSaves);
Pagination<int,QuestionUserSaveState> nextQuestionUserSavesFailedReducer(Pagination<int,QuestionUserSaveState> prev, NextQuestionUserSavesFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,QuestionUserSaveState>> questionUserSavesReducers = combineReducers<Pagination<int,QuestionUserSaveState>>([
  TypedReducer<Pagination<int,QuestionUserSaveState>, CreateQuestionUserSaveSuccessAction>(createQuestionUserSaveSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionUserSaveState>, DeleteQuestionUserSaveSuccesAction>(deleteQuestionUserSaveFailedReducer).call,

  TypedReducer<Pagination<int,QuestionUserSaveState>, NextQuestionUserSavesAction>(nextQuestionUserSavesReducer).call,
  TypedReducer<Pagination<int,QuestionUserSaveState>, NextQuestionUserSavesSuccessAction>(nextQuestionUserSavesSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionUserSaveState>, NextQuestionUserSavesFailedAction>(nextQuestionUserSavesFailedReducer).call,
]);