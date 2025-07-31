import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_container.dart';
import 'package:redux/redux.dart';

EntityContainer<UserState> selectUserById(Store<AppState> store, int id) =>
  store.state.users.usersById[id];
EntityContainer<UserState> selectUserByUserName(Store<AppState> store, String userName) =>
  store.state.users.usersByUserName[userName];