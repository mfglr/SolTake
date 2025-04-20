import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:redux/redux.dart';

UserState? selectUser(Store<AppState> store,int userId) => store.state.userEntityState.getValue(userId);
Multimedia? selectUserImage(Store<AppState> store, int userId) => selectUser(store, userId)?.image;