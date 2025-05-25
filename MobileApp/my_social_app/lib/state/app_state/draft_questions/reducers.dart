import 'package:my_social_app/state/app_state/draft_questions/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, Id<int>> nextDraftQuestionsReducer(Pagination<int, Id<int>> prev, NextDraftQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int, Id<int>> nextDraftQuestionsSuccessReducer(Pagination<int, Id<int>> prev, NextDraftQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((id) => Id(id: id)));
Pagination<int, Id<int>> nextDraftQuestionsFailedReducer(Pagination<int, Id<int>> prev, NextDraftQuestionsFailedAction action)
  => prev.stopLoadingNext();
Pagination<int,Id<int>> addDraftQuestionReducer(Pagination<int,Id<int>> prev, AddDraftQuestionAction action)
  => prev.prependOne(Id(id:action.questionId));



Reducer<Pagination<int,Id<int>>> dratfQuestionsReducers = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextDraftQuestionsAction>(nextDraftQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextDraftQuestionsSuccessAction>(nextDraftQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextDraftQuestionsFailedAction>(nextDraftQuestionsFailedReducer).call,
  TypedReducer<Pagination<int,Id<int>>,AddDraftQuestionAction>(addDraftQuestionReducer).call,
]);