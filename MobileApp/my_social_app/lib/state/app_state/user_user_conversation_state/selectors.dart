
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_conversation_state/user_user_conversation_state.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination selectUserUserConversationPagination(Store<AppState> store) => store.state.userUserConversations;
Page selectUserUserConversationNextPage(Store<AppState> store) => store.state.userUserConversations.next;
Iterable<UserUserConversationState> selectUserUserConversations(Store<AppState> store) => store.state.userUserConversations.values;