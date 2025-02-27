import 'package:my_social_app/state/app_state/home_page_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<num,Id<num>> nextQuestionsReducer(Pagination<num,Id<num>> prev,NextHomeQuestionsAction action)
  => prev.startLoadingNext();
Pagination<num,Id<num>> nextQuestionsSuccessReducer(Pagination<num,Id<num>> prev,NextHomeQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<num,Id<num>> nextQuestionsFailedReducer(Pagination<num,Id<num>> prev,NextHomeQuestionsFailedAction action)
  => prev.stopLoadingNext();
Pagination<num,Id<num>> prevQuestionsReducer(Pagination<num,Id<num>> prev,PrevHomePageQuestionsAction action)
  => prev.startLoadingPrev();
Pagination<num,Id<num>> prevQuestionsSuccessReducer(Pagination<num,Id<num>> prev,PrevHomeQuestionsSuccessAction action)
  => prev.addPrevPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<num,Id<num>> prevQuestionsFailedReducer(Pagination<num,Id<num>> prev,PrevHomeQuestionsFailedAction action)
  => prev.stopLoadingPrev();

Reducer<Pagination<num,Id<num>>> homePageQuestionsReducers = combineReducers<Pagination<num,Id<num>>>([
  TypedReducer<Pagination<num,Id<num>>,NextHomeQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextHomeQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextHomeQuestionsFailedAction>(nextQuestionsFailedReducer).call,
  TypedReducer<Pagination<num,Id<num>>,PrevHomePageQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<Pagination<num,Id<num>>,PrevHomeQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<Pagination<num,Id<num>>,PrevHomeQuestionsFailedAction>(prevQuestionsFailedReducer).call,
]);