import 'package:my_social_app/state/app_state/video_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<num,Id<num>> nextVideoQuestionsReducer(Pagination<num,Id<num>> prev, NextVideoQuestionsAction action)
  => prev.startLoadingNext();
Pagination<num,Id<num>> nextVideoQuestionsSuccessReducer(Pagination<num,Id<num>> prev,NextVideoQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds.map((questionId) => Id(id: questionId)));
Pagination<num,Id<num>> nextVideoQuestionsFailedReducer(Pagination<num,Id<num>> prev, NextVideoQuestionsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<num,Id<num>>> videoQuestionsReducers = combineReducers<Pagination<num,Id<num>>>([
  TypedReducer<Pagination<num,Id<num>>,NextVideoQuestionsAction>(nextVideoQuestionsReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextVideoQuestionsSuccessAction>(nextVideoQuestionsSuccessReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextVideoQuestionsFailedAction>(nextVideoQuestionsFailedReducer).call,
]);