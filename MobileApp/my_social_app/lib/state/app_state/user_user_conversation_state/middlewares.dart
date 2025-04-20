import 'package:my_social_app/services/user_user_conversation_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/selectors.dart';
import 'package:redux/redux.dart';

void nextUserUserConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserUserConversationsAction){
    UserUserConversationService()
      .get(selectUserUserConversationNextPage(store))
      .then((e) => store.dispatch(NextUserUserConversationsSuccessAction(conversations: e.map((s) => s.toState()))))
      .catchError((e){
        store.dispatch(const NextUserUserConversationsFailedAction());
        throw e;
      });
  }
  next(action);
}