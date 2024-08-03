import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/message_home_page_state/message_home_page_state.dart';
import 'package:redux/redux.dart';

MessageHomePageState nextPageConversationsReducer(MessageHomePageState prev,NextPageConversationsSuccessAction action)
  => prev.nextPage(action.userIds);
MessageHomePageState getNewMessageSendersSuccessReducer(MessageHomePageState prev,GetNewMessageSendersSuccessAction action)
  => prev.addNewMessageSenders(action.userIds);

Reducer<MessageHomePageState> messageHomePageReducers = combineReducers<MessageHomePageState>([
  TypedReducer<MessageHomePageState,NextPageConversationsSuccessAction>(nextPageConversationsReducer).call,
  TypedReducer<MessageHomePageState,GetNewMessageSendersSuccessAction>(getNewMessageSendersSuccessReducer).call,
]);