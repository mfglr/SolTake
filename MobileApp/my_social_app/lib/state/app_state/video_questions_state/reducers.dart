import 'package:my_social_app/state/app_state/video_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination nextVideoQuestionsReducer(Pagination prev, NextVideoQuestionsAction action)
  => prev.startLoadingNext();
Pagination nextVideoQuestionsSuccessReducer(Pagination prev,NextVideoQuestionsSuccessAction action)
  => prev.addNextPage(action.questionIds);
Pagination nextVideoQuestionsFailedReducer(Pagination prev, NextVideoQuestionsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination> videoQuestionsReducers = combineReducers<Pagination>([
  TypedReducer<Pagination,NextVideoQuestionsAction>(nextVideoQuestionsReducer).call,
  TypedReducer<Pagination,NextVideoQuestionsSuccessAction>(nextVideoQuestionsSuccessReducer).call,
  TypedReducer<Pagination,NextVideoQuestionsFailedAction>(nextVideoQuestionsFailedReducer).call,
]);