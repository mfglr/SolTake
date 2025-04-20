import 'package:my_social_app/state/app_state/user_user_conversation_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,UserUserConversationState> nextUserUserConversationsReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsAction action)
  => prev.startLoadingNext();
Pagination<int,UserUserConversationState> nextUserUserConversationSuccessReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsSuccessAction action)
  => prev.addNextPage(action.conversations);
Pagination<int,UserUserConversationState> nextUserUserConversationFailedReducer(Pagination<int,UserUserConversationState> prev, NextUserUserConversationsFailedAction action)
  => prev.stopLoadingNext();


Reducer<Pagination<int,UserUserConversationState>> userUserConversationReducers = combineReducers<Pagination<int,UserUserConversationState>>([
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsAction>(nextUserUserConversationsReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsSuccessAction>(nextUserUserConversationSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserConversationState>,NextUserUserConversationsFailedAction>(nextUserUserConversationFailedReducer).call,
]);