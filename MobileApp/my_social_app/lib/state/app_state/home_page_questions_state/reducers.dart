import 'package:my_social_app/state/app_state/home_page_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> nextQuestionsReducer(Pagination<int,Id<int>> prev,NextHomeQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextQuestionsSuccessReducer(Pagination<int,Id<int>> prev,NextHomeQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<int,Id<int>> nextQuestionsFailedReducer(Pagination<int,Id<int>> prev,NextHomeQuestionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,Id<int>> prevQuestionsReducer(Pagination<int,Id<int>> prev,PrevHomeQuestionsAction action)
  => prev.startLoadingPrev();
Pagination<int,Id<int>> prevQuestionsSuccessReducer(Pagination<int,Id<int>> prev,PrevHomeQuestionsSuccessAction action)
  => prev.addPrevPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<int,Id<int>> prevQuestionsFailedReducer(Pagination<int,Id<int>> prev,PrevHomeQuestionsFailedAction action)
  => prev.stopLoadingPrev();

Pagination<int,Id<int>> firstQuestionsReducer(Pagination<int,Id<int>> prev, FirstHomeQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> firstQuestionsSuccessReducer(Pagination<int,Id<int>> prev,FirstHomeQuestionsSuccessAction action)
  => prev.addfirstPage(action.questionIds.map((e) => Id(id: e)));
Pagination<int,Id<int>> firstQuestionsFailedReducer(Pagination<int,Id<int>> prev,FirstHomeQuestionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,Id<int>> deleteHomeQuestionReducer(Pagination<int,Id<int>> prev, DeleteHomeQuestionAction action)
  => prev.removeOne(action.id);

Reducer<Pagination<int,Id<int>>> homePageQuestionsReducers = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextHomeQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextHomeQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextHomeQuestionsFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,Id<int>>,PrevHomeQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,PrevHomeQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,PrevHomeQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,Id<int>>,FirstHomeQuestionsAction>(firstQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,FirstHomeQuestionsSuccessAction>(firstQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,FirstHomeQuestionsFailedAction>(firstQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,Id<int>>,DeleteHomeQuestionAction>(deleteHomeQuestionReducer).call,
]);