import 'package:my_social_app/state/app_state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/message_connection_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,MessageConnectionState> loadMessageConnectionSuccessReducer(EntityState<int,MessageConnectionState> prev,LoadMessageConnectionSuccessAction action)
  => prev.appendOne(action.messageConnectionState);
EntityState<int,MessageConnectionState> changeMessageConnectionStateReducer(EntityState<int,MessageConnectionState> prev, ChangeMessageConnectionStateAction action)
  => prev.updateElseAppendOne(action.state);

Reducer<EntityState<int,MessageConnectionState>> messageConnectionsReducers = combineReducers<EntityState<int,MessageConnectionState>>([
  TypedReducer<EntityState<int,MessageConnectionState>,LoadMessageConnectionSuccessAction>(loadMessageConnectionSuccessReducer).call,
  TypedReducer<EntityState<int,MessageConnectionState>,ChangeMessageConnectionStateAction>(changeMessageConnectionStateReducer).call,
]);