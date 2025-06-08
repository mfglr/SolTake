import 'package:my_social_app/state/app_state/not_published_questions/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, Id<int>> nextNotPublishedQuestionsReducer(Pagination<int, Id<int>> prev, NextNotPublishedQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int, Id<int>> nextNotPublishedQuestionsSuccessReducer(Pagination<int, Id<int>> prev, NextNotPublishedQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((id) => Id(id: id)));
Pagination<int, Id<int>> nextNotPublishedQuestionsFailedReducer(Pagination<int, Id<int>> prev, NextNotPublishedQuestionsFailedAction action)
  => prev.stopLoadingNext();
Pagination<int,Id<int>> addNotPublishedQuestionReducer(Pagination<int,Id<int>> prev, AddNotPublishedQuestionAction action)
  => prev.prependOne(Id(id:action.questionId));
Pagination<int,Id<int>> removeNotPublishedQuestionReducer(Pagination<int,Id<int>> prev, RemoveNotPublishedQuestionAction action)
  => prev.removeOne(action.questionId);

Reducer<Pagination<int,Id<int>>> dratfQuestionsReducers = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextNotPublishedQuestionsAction>(nextNotPublishedQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextNotPublishedQuestionsSuccessAction>(nextNotPublishedQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextNotPublishedQuestionsFailedAction>(nextNotPublishedQuestionsFailedReducer).call,
  TypedReducer<Pagination<int,Id<int>>,AddNotPublishedQuestionAction>(addNotPublishedQuestionReducer).call,
  TypedReducer<Pagination<int,Id<int>>,RemoveNotPublishedQuestionAction>(removeNotPublishedQuestionReducer).call,
]);