import 'package:my_social_app/state/search_users_state/actions.dart';
import 'package:my_social_app/state/search_users_state/search_user_state.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,SearchUserState> removeSearchUserReducer(Pagination<int, SearchUserState> prev,RemoveSearchUserAction action)
  => prev.removeOne(action.userId);

Pagination<int,SearchUserState> firstSearchUsersReducer(Pagination<int,SearchUserState> prev,FirstSearchUsersAction action)
  => prev.startLoadingNext();
Pagination<int,SearchUserState> firstSearchUsersSuccessReducer(Pagination<int,SearchUserState> prev, FirstSearchUsersSuccessAction action)
  => prev.refreshPage(action.users);
Pagination<int,SearchUserState> firstSearchUsersFailedReducer(Pagination<int,SearchUserState> prev, FirstSearchUsersFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SearchUserState> nextSearchUsersReducer(Pagination<int,SearchUserState> prev, NextSearchUsersAction action)
  => prev.startLoadingNext();
Pagination<int,SearchUserState> nextSearchUsersSuccessReducer(Pagination<int,SearchUserState> prev, NextSearchUsersSuccessAction action)
  => prev.addNextPage(action.users);
Pagination<int,SearchUserState> nextSearchUsersFailedReducer(Pagination<int,SearchUserState> prev, NextSearchUsersFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,SearchUserState> prevSearchUsersReducer(Pagination<int,SearchUserState> prev, PrevSearchUsersAction action)
  => prev.startLoadingPrev();
Pagination<int,SearchUserState> prevSearchUsersSuccessReducer(Pagination<int,SearchUserState> prev,PrevSearchUsersSuccessAction action)
  => prev.addPrevPage(action.users);
Pagination<int,SearchUserState> prevSearchUsersFailedReducer(Pagination<int,SearchUserState> prev,PrevSearchUsersFailedAction action)
  => prev.stopLoadingPrev();

Reducer<Pagination<int,SearchUserState>> searchUsersReducers = combineReducers<Pagination<int,SearchUserState>>([
  TypedReducer<Pagination<int,SearchUserState>,RemoveSearchUserAction>(removeSearchUserReducer).call,

  TypedReducer<Pagination<int,SearchUserState>,FirstSearchUsersAction>(firstSearchUsersReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,FirstSearchUsersSuccessAction>(firstSearchUsersSuccessReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,FirstSearchUsersFailedAction>(firstSearchUsersFailedReducer).call,

  TypedReducer<Pagination<int,SearchUserState>,NextSearchUsersAction>(nextSearchUsersReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,NextSearchUsersSuccessAction>(nextSearchUsersSuccessReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,NextSearchUsersFailedAction>(nextSearchUsersFailedReducer).call,

  TypedReducer<Pagination<int,SearchUserState>,PrevSearchUsersAction>(prevSearchUsersReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,PrevSearchUsersSuccessAction>(prevSearchUsersSuccessReducer).call,
  TypedReducer<Pagination<int,SearchUserState>,PrevSearchUsersFailedAction>(prevSearchUsersFailedReducer).call,
]);
