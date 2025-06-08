import 'package:my_social_app/state/app_state/rejected_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> nextRejectedQuestionsReducer(Pagination<int, Id<int>> prev, NextRejectedQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextRejectedQuestionsSuccessReducer(Pagination<int,Id<int>> prev, NextRejectedQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((id) => Id(id: id)));
Pagination<int, Id<int>> nextRejectedQuestionsFailedReducer(Pagination<int, Id<int>> prev, NextRejectedQuestionsFailedAction action)
  => prev.stopLoadingNext();
Pagination<int, Id<int>> removeRejectedQuestionReducer(Pagination<int, Id<int>> prev, RemoveRejectedQuestionAction action)
  => prev.removeOne(action.questionId);

Reducer<Pagination<int,Id<int>>> rejectedQuestionsReducer = combineReducers([
  TypedReducer<Pagination<int, Id<int>>,NextRejectedQuestionsAction>(nextRejectedQuestionsReducer).call,
  TypedReducer<Pagination<int, Id<int>>,NextRejectedQuestionsSuccessAction>(nextRejectedQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int, Id<int>>,NextRejectedQuestionsFailedAction>(nextRejectedQuestionsFailedReducer).call,
  TypedReducer<Pagination<int, Id<int>>,RemoveRejectedQuestionAction>(removeRejectedQuestionReducer).call,
]);
