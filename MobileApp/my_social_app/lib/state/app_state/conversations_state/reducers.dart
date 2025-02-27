import 'package:my_social_app/state/app_state/conversations_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<num,Id<num>> nextConversationsReducer(Pagination<num,Id<num>> prev,NextConversationsAction action)
  => prev.startLoadingNext();
Pagination<num,Id<num>> nextConversationsSuccessReducer(Pagination<num,Id<num>> prev,NextConversationsSuccessAction action)
  => prev.addNextPage(action.messageIds.map((e) => Id(id: e)));
Pagination<num,Id<num>> nextConversationsFailedReducer(Pagination<num,Id<num>> prev,NextConversationsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<num,Id<num>>> conversationsReducer = combineReducers<Pagination<num,Id<num>>>([
  TypedReducer<Pagination<num,Id<num>>,NextConversationsAction>(nextConversationsReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextConversationsSuccessAction>(nextConversationsSuccessReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextConversationsFailedAction>(nextConversationsFailedReducer).call,
]);