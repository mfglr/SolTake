import 'package:my_social_app/state/conversations_state/actions.dart';
import 'package:my_social_app/packages/entity_state/id.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> nextConversationsReducer(Pagination<int,Id<int>> prev,NextConversationsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextConversationsSuccessReducer(Pagination<int,Id<int>> prev,NextConversationsSuccessAction action)
  => prev.addNextPage(action.messageIds.map((e) => Id(id: e)));
Pagination<int,Id<int>> nextConversationsFailedReducer(Pagination<int,Id<int>> prev,NextConversationsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,Id<int>>> conversationsReducer = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextConversationsAction>(nextConversationsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextConversationsSuccessAction>(nextConversationsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextConversationsFailedAction>(nextConversationsFailedReducer).call,
]);