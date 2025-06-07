import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/question_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';

Pagination<int,QuestionState> nextAllNotPublishedQuestionsReducer(Pagination<int, QuestionState> prev, NextAllNotPublishedQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,QuestionState> nextAllNotPublishedSuccessReducer(Pagination<int,QuestionState> prev, NextAllNotPublishedQuestionsSuccessAction action)
  => prev.addNextPage(action.questions);
Pagination<int,QuestionState> nextAllNotPublishedQuestionsFailedReducer(Pagination<int,QuestionState> prev, NextAllNotPublishedQuestionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,QuestionState> firstAllNotPublishedQuestionsReducer(Pagination<int, QuestionState> prev, FirstAllNotPublishedQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,QuestionState> firstAlNotPublishedQuestionsSuccessReducer(Pagination<int,QuestionState> prev, FirstAllNotPublishedQuestionsSuccessAction action)
  => prev.addfirstPage(action.questions);
Pagination<int,QuestionState> firstAllNotPublishedQuestionsFailedReducer(Pagination<int,QuestionState> prev, FirstAllNotPublishedQuestionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,QuestionState> publishQuestionSuccessReducer(Pagination<int,QuestionState> prev, PublishQuestionSuccessAction action)
  => prev.removeOne(action.questionId);

Reducer<Pagination<int,QuestionState>> questionReducers = combineReducers<Pagination<int,QuestionState>>([
  TypedReducer<Pagination<int,QuestionState>,NextAllNotPublishedQuestionsAction>(nextAllNotPublishedQuestionsReducer).call,
  TypedReducer<Pagination<int,QuestionState>,NextAllNotPublishedQuestionsSuccessAction>(nextAllNotPublishedSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionState>,NextAllNotPublishedQuestionsFailedAction>(nextAllNotPublishedQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,QuestionState>,FirstAllNotPublishedQuestionsAction>(firstAllNotPublishedQuestionsReducer).call,
  TypedReducer<Pagination<int,QuestionState>,FirstAllNotPublishedQuestionsSuccessAction>(firstAlNotPublishedQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,QuestionState>,FirstAllNotPublishedQuestionsFailedAction>(firstAllNotPublishedQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,QuestionState>,PublishQuestionSuccessAction>(publishQuestionSuccessReducer).call,
]);