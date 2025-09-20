import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/user_user_conversation_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_user_conversation_state/actions.dart';
import 'package:my_social_app/state/user_user_conversation_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
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


void firstUserUserConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstUserUserConversationsAction){
    UserUserConversationService()
      .get(Page<int>.init(usersPerPage, true))
      .then((e) => store.dispatch(FirstUserUserConversationsSuccessAction(conversations: e.map((s) => s.toState()))))
      .catchError((e){
        store.dispatch(const FirstUserUserConversationsFailedAction());
        throw e;
      });
  }
  next(action);
}