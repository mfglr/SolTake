import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/message_home_page_state.dart';
import 'package:redux/redux.dart';

MessageHomePageState startLoadingNextPageReducer(MessageHomePageState prev,GetNextPageConversationsAction action)
  => prev.startLoadingNext();
MessageHomePageState nextPageConversationsReducer(MessageHomePageState prev,AddNextPageConversationsAction action)
  => prev.nextPage(action.messageIds);

Reducer<MessageHomePageState> messageHomePageReducers = combineReducers<MessageHomePageState>([
  TypedReducer<MessageHomePageState,GetNextPageConversationsAction>(startLoadingNextPageReducer).call,
  TypedReducer<MessageHomePageState,AddNextPageConversationsAction>(nextPageConversationsReducer).call,
]);