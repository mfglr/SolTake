import 'package:my_social_app/state/app_state/follow_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_entity_state.dart';
import 'package:redux/redux.dart';

FollowEntityState addFollowsReducer(FollowEntityState prev,AddFollowsAction action)
  => prev.addFollows(action.follows);
FollowEntityState addFollowReducer(FollowEntityState prev,AddFollowAction action)
  => prev.addFollow(action.follow);
FollowEntityState removeFollowReducer(FollowEntityState prev,RemoveFollowAction action)
  => prev.removeFollow(action.followId);

Reducer<FollowEntityState> followEntityReducers = combineReducers<FollowEntityState>([
  TypedReducer<FollowEntityState,AddFollowsAction>(addFollowsReducer).call,
  TypedReducer<FollowEntityState,AddFollowAction>(addFollowReducer).call,
  TypedReducer<FollowEntityState,RemoveFollowAction>(removeFollowReducer).call,
]);