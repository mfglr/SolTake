import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void loadMessageConnectionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadMessageConnectionAction){
    MessageHub()
      .getMessageConnectionById(action.userId)
      .then((e) => store.dispatch(UpdateMessageConnectionStateAction(state: e.toMessageConnectionState())));
  }
  next(action);
}
