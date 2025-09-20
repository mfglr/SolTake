import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:redux/redux.dart';

EntityContainer<int, UserState> selectUserById(Store<AppState> store, int id) =>
  store.state.users.usersById[id];
EntityContainer<String, UserState> selectUserByUserName(Store<AppState> store, String userName) =>
  store.state.users.usersByUserName[userName];



