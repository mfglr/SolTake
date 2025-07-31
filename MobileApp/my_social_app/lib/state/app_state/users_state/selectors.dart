import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/users_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_container.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

EntityContainer<UserState> selectUserById(Store<AppState> store, int id) =>
  store.state.users.usersById[id];
EntityContainer<UserState> selectUserByUserName(Store<AppState> store, String userName) =>
  store.state.users.usersByUserName[userName];


Pagination<int,FollowState> selectFollowersFromState(UsersState state, int userId) =>
  state.followers[userId] ?? Pagination.init(usersPerPage, true); 
Pagination<int,FollowState> selectFollowers(Store<AppState> store, int userId) =>
  selectFollowersFromState(store.state.users,userId);
Future<bool> onFollowersLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectFollowersFromState(store.state.users,userId).loadingNext).first;

Pagination<int,FollowState> selectFollowedsFromState(UsersState state, int userId) =>
  state.followeds[userId] ?? Pagination.init(usersPerPage, true); 
Pagination<int,FollowState> selectFolloweds(Store<AppState> store, int userId) =>
  selectFollowedsFromState(store.state.users,userId);
Future<bool> onFollowedsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectFollowedsFromState(store.state.users,userId).loadingNext).first;
