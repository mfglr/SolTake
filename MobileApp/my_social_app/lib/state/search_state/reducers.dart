import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:redux/redux.dart';

SearchState getFirstPageUserReducer(SearchState prev, GetFirstPageSearchingUsersAction action)
  => prev.startLoadingUsers();
SearchState addFirstPageUserReducer(SearchState prev,AddFirstPageSearchingUsersAction action)
  => prev.addFirstPageUsers(action.userIds);
SearchState addNextPageUsersReducer(SearchState prev,AddNextPageSearchingUsersAction action)
  => prev.addNextPageUsers(action.userIds);

SearchState getFirstPageQuestionsReducer(SearchState prev,GetFirstPageSearchingQuestionsAction action)
  => prev.startLoadingQuestions();
SearchState addFirstPageQuestionsReducer(SearchState prev,AddFirstPageSearchingQuestionsAction action)
  => prev.addFirstPageQuestions(action.questionIds);
SearchState getNextPageQuestionsReducer(SearchState prev,GetNextPageSearchingQuestionsAction action)
  => prev.startLoadingQuestions();
SearchState addNextPageQuestionsReducer(SearchState prev,AddNextPageSearchingQuestionsAction action)
  => prev.addNextPageQuestions(action.questionIds);

SearchState changeKeyReducer(SearchState prev,ChangeSearchKeyAction action)
  => prev.changeKey(action.key);
SearchState changeExamIdReducer(SearchState prev,ChangeSearchExamIdAction action)
  => prev.changeExamId(action.examId);
SearchState changeSubjectIdReducer(SearchState prev,ChangeSearchSubjectIdAction action)
  => prev.changeSubjectId(action.subjectId);
SearchState changeTopicIdReducer(SearchState prev,ChangeSearchTopicIdAction action)
  => prev.changeTopicId(action.topicId);

SearchState clearSearchingReducer(SearchState prev,ClearSearchingAction action)
  => prev.clear();

Reducer<SearchState> searchStateReducers = combineReducers<SearchState>([
  TypedReducer<SearchState,GetFirstPageSearchingUsersAction>(getFirstPageUserReducer).call,
  TypedReducer<SearchState,AddFirstPageSearchingUsersAction>(addFirstPageUserReducer).call,
  TypedReducer<SearchState,AddNextPageSearchingUsersAction>(addNextPageUsersReducer).call,

  TypedReducer<SearchState,GetFirstPageSearchingQuestionsAction>(getFirstPageQuestionsReducer).call,
  TypedReducer<SearchState,AddFirstPageSearchingQuestionsAction>(addFirstPageQuestionsReducer).call,
  TypedReducer<SearchState,GetNextPageSearchingQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<SearchState,AddNextPageSearchingQuestionsAction>(addNextPageQuestionsReducer).call,

  TypedReducer<SearchState,ChangeSearchKeyAction>(changeKeyReducer).call,
  TypedReducer<SearchState,ChangeSearchExamIdAction>(changeExamIdReducer).call,
  TypedReducer<SearchState,ChangeSearchSubjectIdAction>(changeSubjectIdReducer).call,
  TypedReducer<SearchState,ChangeSearchTopicIdAction>(changeTopicIdReducer).call,

  TypedReducer<SearchState,ClearSearchingAction>(clearSearchingReducer).call,
]);