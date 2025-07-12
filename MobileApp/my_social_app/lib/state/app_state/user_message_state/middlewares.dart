import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_message_state/actions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

void nextUserMessagesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserMessagesAction){
    var page = 
      store.state.userMessageState.getValue(action.userId)?.messageIds.next ??
      Pagination.init(messagesPerPage, true).next;

    MessageHub()
      .getByUserId(action.userId, page)
      .then((messages){
        store.dispatch(NextUserMessagesSuccessAction(userId: action.userId, messageIds: messages.map((e) => e.id)));
        store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
      })
      .catchError((e) => store.dispatch(NextUserMessagesFailedAction(userId: action.userId)));
  }
  next(action);
}