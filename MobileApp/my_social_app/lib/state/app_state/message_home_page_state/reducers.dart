import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/message_home_page_state.dart';
import 'package:redux/redux.dart';

MessageHomePageState nextConversationsReducer(MessageHomePageState prev,NextConversationsAction action)
  => prev.startLoadingNextConversations();
MessageHomePageState nextConversationsSuccessReducer(MessageHomePageState prev,NextConversationsSuccessAction action)
  => prev.addNextPageConversations(action.messageIds);
MessageHomePageState nextConversationsFailedReducer(MessageHomePageState prev,NextConversationsFailedAction action)
  => prev.stopLoadingNextConversations();

Reducer<MessageHomePageState> messageHomePageReducers = combineReducers<MessageHomePageState>([
  TypedReducer<MessageHomePageState,NextConversationsAction>(nextConversationsReducer).call,
  TypedReducer<MessageHomePageState,NextConversationsSuccessAction>(nextConversationsSuccessReducer).call,
  TypedReducer<MessageHomePageState,NextConversationsFailedAction>(nextConversationsFailedReducer).call,
]);