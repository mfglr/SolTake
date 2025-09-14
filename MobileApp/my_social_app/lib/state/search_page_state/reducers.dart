import 'package:my_social_app/state/search_page_state/actions.dart';
import 'package:my_social_app/state/search_page_state/search_page_state.dart';
import 'package:redux/redux.dart';

SearchPageState changeExamReducer(SearchPageState prev, ChangeExamAction action) =>
  prev.changeExam(action.exam);
SearchPageState changeSubjectReducer(SearchPageState prev, ChangeSubjectAction action) =>
  prev.changeSubject(action.subject);
SearchPageState changeTopicReducer(SearchPageState prev, ChangeTopicAction action) =>
  prev.changeTopic(action.topic);

Reducer<SearchPageState> searchPageReducers = combineReducers<SearchPageState>([
  TypedReducer<SearchPageState,ChangeExamAction>(changeExamReducer).call,
  TypedReducer<SearchPageState,ChangeSubjectAction>(changeSubjectReducer).call,
  TypedReducer<SearchPageState,ChangeTopicAction>(changeTopicReducer).call,
]);