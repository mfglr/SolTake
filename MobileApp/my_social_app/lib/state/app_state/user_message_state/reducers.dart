import 'package:my_social_app/state/app_state/user_message_state/actions.dart';
import 'package:my_social_app/state/app_state/user_message_state/user_message_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,UserMessageState> nextUserMessagesReducer(EntityState<int,UserMessageState> prev,NextUserMessagesAction action)
  => prev
      .updateElseAppendOne(
        prev.getValue(action.userId)?.startLoadingNext() ??
        UserMessageState.init(action.userId).startLoadingNext()
      );
EntityState<int, UserMessageState> nextUserMessagesSuccessReducer(EntityState<int,UserMessageState> prev, NextUserMessagesSuccessAction action)
  => prev.updateOne(prev.getValue(action.userId)!.addNextPage(action.messageIds));
EntityState<int, UserMessageState> nextUserMessageFailedReducer(EntityState<int,UserMessageState> prev, NextUserMessagesFailedAction action)
  => prev.updateOne(prev.getValue(action.userId)!.stopLoadingNext());

EntityState<int, UserMessageState> addUserMessageAction(EntityState<int,UserMessageState> prev, AddUserMessageAction action)
  => prev
      .updateElseAppendOne(
        prev.getValue(action.userId)?.prependUniqOne(action.messageId) ??
        UserMessageState.init(action.userId).prependOne(action.messageId)
      );

EntityState<int, UserMessageState> removeUserMessageAction(EntityState<int,UserMessageState> prev, RemoveUserMessageAction action)
  => prev.updateOne(prev.getValue(action.userId)!.removeOne(action.messageId));


Reducer<EntityState<int, UserMessageState>> userMessageReducers = combineReducers<EntityState<int, UserMessageState>>([
  TypedReducer<EntityState<int, UserMessageState>, NextUserMessagesAction>(nextUserMessagesReducer).call,
  TypedReducer<EntityState<int, UserMessageState>, NextUserMessagesSuccessAction>(nextUserMessagesSuccessReducer).call,
  TypedReducer<EntityState<int, UserMessageState>, AddUserMessageAction>(addUserMessageAction).call,
  TypedReducer<EntityState<int, UserMessageState>, RemoveUserMessageAction>(removeUserMessageAction).call,
]);