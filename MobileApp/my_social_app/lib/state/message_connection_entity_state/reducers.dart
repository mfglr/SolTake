import 'package:my_social_app/state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,MessageConnectionState> updateMessageConnectionStateReducer(EntityState<int,MessageConnectionState> prev, UpdateMessageConnectionStateAction action)
  => prev.updateElseAppendOne(action.state);

Reducer<EntityState<int,MessageConnectionState>> messageConnectionsReducers = combineReducers<EntityState<int,MessageConnectionState>>([
  TypedReducer<EntityState<int,MessageConnectionState>,UpdateMessageConnectionStateAction>(updateMessageConnectionStateReducer).call,
]);