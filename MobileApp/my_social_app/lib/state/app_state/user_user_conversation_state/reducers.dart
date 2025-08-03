import 'package:my_social_app/state/app_state/user_user_conversation_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,UserUserConversationState> removeUserUserConversationReducer(Pagination<int,UserUserConversationState> prev, RemoveUserUserConversationAction action)
  => prev.where((e) => e.userId != action.userId);

Pagination<int,UserUserConversationState> nextUserUserConversationsReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsAction action)
  => prev.startLoadingNext();
Pagination<int,UserUserConversationState> nextUserUserConversationSuccessReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsSuccessAction action)
  => prev.addNextPage(action.conversations);
Pagination<int,UserUserConversationState> nextUserUserConversationFailedReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,UserUserConversationState> firstUserUserConversationsReducer(Pagination<int,UserUserConversationState> prev, FirstUserUserConversationsAction action)
  => prev.startLoadingNext();
Pagination<int,UserUserConversationState> firstUserUserConversationSuccessReducer(Pagination<int,UserUserConversationState> prev, FirstUserUserConversationsSuccessAction action)
  => prev.refreshPage(action.conversations);
Pagination<int,UserUserConversationState> firstUserUserConversationFailedReducer(Pagination<int,UserUserConversationState> prev, FirstUserUserConversationsFailedAction action)
  => prev.stopLoadingNext();


Reducer<Pagination<int,UserUserConversationState>> userUserConversationReducers = combineReducers<Pagination<int,UserUserConversationState>>([
  TypedReducer<Pagination<int,UserUserConversationState>,RemoveUserUserConversationAction>(removeUserUserConversationReducer).call,
  
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsAction>(nextUserUserConversationsReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsSuccessAction>(nextUserUserConversationSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsFailedAction>(nextUserUserConversationFailedReducer).call,

  TypedReducer<Pagination<int,UserUserConversationState>,FirstUserUserConversationsAction>(firstUserUserConversationsReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,FirstUserUserConversationsSuccessAction>(firstUserUserConversationSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,FirstUserUserConversationsFailedAction>(firstUserUserConversationFailedReducer).call,
]);