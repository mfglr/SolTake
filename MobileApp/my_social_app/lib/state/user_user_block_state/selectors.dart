import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination selectUserUserBlocksPagination(Store<AppState> store) => store.state.userUserBlocks;
Page selectNextPageOfUserUserBlocks(Store<AppState> store) => store.state.userUserBlocks.next;
Page selectFirstPageOfUserUserBlocks(Store<AppState> store) => Page.init(usersPerPage,true);
(Iterable<UserUserBlockState>, bool) selectForDisplayBlockUsers(Store<AppState> store) =>
  (store.state.userUserBlocks.values, store.state.userUserBlocks.isEmpty);