import 'package:my_social_app/state/app_state/video_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> nextVideoQuestionsReducer(Pagination<int,Id<int>> prev, NextVideoQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextVideoQuestionsSuccessReducer(Pagination<int,Id<int>> prev,NextVideoQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<int,Id<int>> nextVideoQuestionsFailedReducer(Pagination<int,Id<int>> prev, NextVideoQuestionsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,Id<int>>> videoQuestionsReducers = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextVideoQuestionsAction>(nextVideoQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextVideoQuestionsSuccessAction>(nextVideoQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextVideoQuestionsFailedAction>(nextVideoQuestionsFailedReducer).call,
]);