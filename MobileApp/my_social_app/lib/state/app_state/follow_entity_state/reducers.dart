import 'package:my_social_app/state/app_state/follow_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,FollowState> addFollowsReducer(EntityState<num,FollowState> prev,AddFollowsAction action)
  => prev.appendMany(action.follows);
EntityState<num,FollowState> addFollowReducer(EntityState<num,FollowState> prev,AddFollowAction action)
  => prev.appendOne(action.follow);
EntityState<num,FollowState> removeFollowReducer(EntityState<num,FollowState> prev,RemoveFollowAction action)
  => prev.where((follow) => follow.id != action.followId);

Reducer<EntityState<num,FollowState>> followEntityReducers = combineReducers<EntityState<num,FollowState>>([
  TypedReducer<EntityState<num,FollowState>,AddFollowsAction>(addFollowsReducer).call,
  TypedReducer<EntityState<num,FollowState>,AddFollowAction>(addFollowReducer).call,
  TypedReducer<EntityState<num,FollowState>,RemoveFollowAction>(removeFollowReducer).call,
]);