import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:redux/redux.dart';

SearchState firstUsersReducer(SearchState prev, FirstSearchingUsersAction action)
  => prev.startLoadingNextUsers();
SearchState firstSearchingUsersSuccessReducer(SearchState prev,FirstSearchingUsersSuccessAction action)
  => prev.addFirstUsers(action.userIds);
SearchState firstSerchingUsersFailedReducer(SearchState prev,FirstSearchingUsersFailedAction action)
  => prev.stopLoadingNextUsers();

SearchState nextUsersReducer(SearchState prev, NextSearchingUsersAction action)
  => prev.startLoadingNextUsers();
SearchState nextUsersSuccessReducer(SearchState prev,NextSearchingUsersSuccessAction action)
  => prev.addNextUsers(action.userIds);
SearchState nextUsersFailedReducer(SearchState prev,NextSearhcingUsersFailedAction action)
  => prev.stopLoadingNextUsers();

SearchState firstQuestionsReducer(SearchState prev,FirstSearchingQuestionsAction action)
  => prev.startLoadingNextQuestions();
SearchState firstQuestionsSuccessReducer(SearchState prev,FirstSearchingQuestionsSuccessAction action)
  => prev.addFirstQuestions(action.questionIds);
SearchState firstQuestionsFailedReducer(SearchState prev, FirstSearchingQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions();

SearchState nextQuestionsReducer(SearchState prev,NextSearchingQuestionsAction action)
  => prev.startLoadingNextQuestions();
SearchState nextQuestionsSuccessReducer(SearchState prev,NextSearchingQuestionsSuccessAction action)
  => prev.addNextQuestions(action.questionIds);
SearchState nextQuestionsFailedReducer(SearchState prev,NextSearchingQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions();

SearchState nextSearchedUserReducer(SearchState prev,NextSearchedUsersAction action)
  => prev.startLodingSearchedUsers();
SearchState nextSearchedUserSuccessReducer(SearchState prev,NextSearchedUsersSuccessAction action)
  => prev.addNextPageSearchedUsers(action.searchIds);
SearchState nextSearchedUserFailedReducer(SearchState prev,NextSearchedUsersFailedAction action)
  => prev.stopLodingSearchedUsers();

SearchState addSearcherReducer(SearchState prev,AddSearchedUserSuccessAction action)
  => prev.addSearchedUser(action.addedOne,action.removedOne);
SearchState removeSearchedUserReducer(SearchState prev,RemoveSearcedUserSuccessAction action)
  => prev.removeSearchedUser(action.searchId);

SearchState changeKeyReducer(SearchState prev,ChangeSearchKeyAction action)
  => prev.changeKey(action.key);
SearchState changeExamIdReducer(SearchState prev,ChangeSearchExamIdAction action)
  => prev.changeExamId(action.examId);
SearchState changeSubjectIdReducer(SearchState prev,ChangeSearchSubjectIdAction action)
  => prev.changeSubjectId(action.subjectId);
SearchState changeTopicIdReducer(SearchState prev,ChangeSearchTopicIdAction action)
  => prev.changeTopicId(action.topicId);
SearchState clearKeyReducer(SearchState prev,ClearKeyAction action)
  => prev.clearKey();

Reducer<SearchState> searchStateReducers = combineReducers<SearchState>([
  TypedReducer<SearchState,FirstSearchingUsersAction>(firstUsersReducer).call,
  TypedReducer<SearchState,FirstSearchingUsersSuccessAction>(firstSearchingUsersSuccessReducer).call,
  TypedReducer<SearchState,FirstSearchingUsersFailedAction>(firstSerchingUsersFailedReducer).call,

  TypedReducer<SearchState,NextSearchingUsersAction>(nextUsersReducer).call,
  TypedReducer<SearchState,NextSearchingUsersSuccessAction>(nextUsersSuccessReducer).call,
  TypedReducer<SearchState,NextSearhcingUsersFailedAction>(nextUsersFailedReducer).call,

  TypedReducer<SearchState,FirstSearchingQuestionsAction>(firstQuestionsReducer).call,
  TypedReducer<SearchState,FirstSearchingQuestionsSuccessAction>(firstQuestionsSuccessReducer).call,
  TypedReducer<SearchState,FirstSearchingQuestionsFailedAction>(firstQuestionsFailedReducer).call,

  TypedReducer<SearchState,NextSearchingQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<SearchState,NextSearchingQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<SearchState,NextSearchingQuestionsFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<SearchState,NextSearchedUsersAction>(nextSearchedUserReducer).call,
  TypedReducer<SearchState,NextSearchedUsersSuccessAction>(nextSearchedUserSuccessReducer).call,
  TypedReducer<SearchState,NextSearchedUsersFailedAction>(nextSearchedUserFailedReducer).call,
  
  TypedReducer<SearchState,AddSearchedUserSuccessAction>(addSearcherReducer).call,
  TypedReducer<SearchState,RemoveSearcedUserSuccessAction>(removeSearchedUserReducer).call,

  TypedReducer<SearchState,ChangeSearchKeyAction>(changeKeyReducer).call,
  TypedReducer<SearchState,ChangeSearchExamIdAction>(changeExamIdReducer).call,
  TypedReducer<SearchState,ChangeSearchSubjectIdAction>(changeSubjectIdReducer).call,
  TypedReducer<SearchState,ChangeSearchTopicIdAction>(changeTopicIdReducer).call,
  TypedReducer<SearchState,ClearKeyAction>(clearKeyReducer).call,
]);