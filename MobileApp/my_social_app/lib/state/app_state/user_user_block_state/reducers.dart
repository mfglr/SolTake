import 'package:my_social_app/state/app_state/user_user_block_state/action.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,UserUserBlockState> blockUserSuccessReducer(Pagination<int,UserUserBlockState> prev, BlockUserSuccessAction action)
  => prev.prependOne(action.userUserBlockState);

Pagination<int,UserUserBlockState> unblockUserSuccessReducer(Pagination<int,UserUserBlockState> prev,UnblockUserSuccessAction action)
  => prev.where((e) => e.userId != action.userId);

Pagination<int,UserUserBlockState> nextUserUserBlocksReducer(Pagination<int,UserUserBlockState> prev, NextUserUserBlocksAction action)
  => prev.startLoadingNext();
Pagination<int,UserUserBlockState> nextUserUserBlocksSuccessReducer(Pagination<int,UserUserBlockState> prev, NextUserUserBlocksSuccessAction action)
  => prev.addNextPage(action.userUserBlocks);
Pagination<int,UserUserBlockState> nextUserUserBlocksFailedReducer(Pagination<int,UserUserBlockState> prev, NextUserUserBlocksFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,UserUserBlockState>> userUserBlockReducers = combineReducers<Pagination<int,UserUserBlockState>>([
  TypedReducer<Pagination<int,UserUserBlockState>,BlockUserSuccessAction>(blockUserSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserBlockState>,UnblockUserSuccessAction>(unblockUserSuccessReducer).call,

  TypedReducer<Pagination<int,UserUserBlockState>,NextUserUserBlocksAction>(nextUserUserBlocksReducer).call,
  TypedReducer<Pagination<int,UserUserBlockState>,NextUserUserBlocksSuccessAction>(nextUserUserBlocksSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserBlockState>,NextUserUserBlocksFailedAction>(nextUserUserBlocksFailedReducer).call,
]);


