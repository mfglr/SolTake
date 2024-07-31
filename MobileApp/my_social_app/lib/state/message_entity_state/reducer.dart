import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_entity_state.dart';
import 'package:redux/redux.dart';

MessageEntityState addMessageReducer(MessageEntityState prev,AddMessageAction action)
  => prev.addMessage(action.message);

Reducer<MessageEntityState> messageEntityStateReducers = combineReducers<MessageEntityState>([
  TypedReducer<MessageEntityState,AddMessageAction>(addMessageReducer).call
]);