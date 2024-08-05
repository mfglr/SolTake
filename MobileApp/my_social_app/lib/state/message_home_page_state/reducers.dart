import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/message_home_page_state/message_home_page_state.dart';
import 'package:redux/redux.dart';

MessageHomePageState nextPageConversationsReducer(MessageHomePageState prev,NextPageConversationsSuccessAction action)
  => prev.nextPage(action.messages);
MessageHomePageState getComingMessagesSuccessReducer(MessageHomePageState prev,GetComingMessagesSuccessAction action)
  => prev.synchronize();

Reducer<MessageHomePageState> messageHomePageReducers = combineReducers<MessageHomePageState>([
  TypedReducer<MessageHomePageState,NextPageConversationsSuccessAction>(nextPageConversationsReducer).call,
  TypedReducer<MessageHomePageState,GetComingMessagesSuccessAction>(getComingMessagesSuccessReducer).call,
]);