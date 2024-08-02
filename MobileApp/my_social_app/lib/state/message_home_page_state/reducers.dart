import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/message_home_page_state/message_home_page_state.dart';
import 'package:redux/redux.dart';

MessageHomePageState nextPageConversationsReducer(MessageHomePageState prev,NextPageConversationsSuccessAction action)
  => prev.nextPage(action.conversations);
MessageHomePageState synchronizeSuccessReducer(MessageHomePageState prev,SynchronizeHomePageSuccessAction action)
  => prev.synchronize(action.conversations);
MessageHomePageState prependConversationReducer(MessageHomePageState prev, PrependConversationAction action)
  => prev.prependOneAndRemovePrev(action.conversation);

Reducer<MessageHomePageState> messageHomePageReducers = combineReducers<MessageHomePageState>([
  TypedReducer<MessageHomePageState,NextPageConversationsSuccessAction>(nextPageConversationsReducer).call,
  TypedReducer<MessageHomePageState,SynchronizeHomePageSuccessAction>(synchronizeSuccessReducer).call,
  TypedReducer<MessageHomePageState,PrependConversationAction>(prependConversationReducer).call,
]);