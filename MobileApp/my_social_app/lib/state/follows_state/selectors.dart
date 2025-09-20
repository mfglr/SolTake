import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
import 'package:my_social_app/state/follows_state/follows_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,FollowState> selectFollowersFromState(FollowsState state, int userId) =>
  state.followers[userId] ?? Pagination.init(usersPerPage, true); 
Pagination<int,FollowState> selectFollowers(Store<AppState> store, int userId) =>
  selectFollowersFromState(store.state.follows,userId);
Future<bool> onFollowersLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectFollowersFromState(store.state.follows,userId).loadingNext).first;

Pagination<int,FollowState> selectFollowedsFromState(FollowsState state, int userId) =>
  state.followeds[userId] ?? Pagination.init(usersPerPage, true); 
Pagination<int,FollowState> selectFolloweds(Store<AppState> store, int userId) =>
  selectFollowedsFromState(store.state.follows,userId);
Future<bool> onFollowedsLoaded(Store<AppState> store, int userId) =>
  store.onChange.map((state) => !selectFollowedsFromState(store.state.follows,userId).loadingNext).first;