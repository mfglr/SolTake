import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';

@immutable
class UserUserBlockAction extends AppAction{
  const UserUserBlockAction();
}

@immutable
class BlockUserAction extends UserUserBlockAction{
  final int userId;
  const BlockUserAction({required this.userId});
}
@immutable
class BlockUserSuccessAction extends UserUserBlockAction{
  final UserUserBlockState userUserBlockState;
  const BlockUserSuccessAction({required this.userUserBlockState});
}

@immutable
class UnblockUserAction extends UserUserBlockAction{
  final int userId;
  const UnblockUserAction({required this.userId});
}
@immutable
class UnblockUserSuccessAction extends UserUserBlockAction{
  final int userId;
  const UnblockUserSuccessAction({required this.userId});
}

@immutable
class NextUserUserBlocksAction extends UserUserBlockAction{
  const NextUserUserBlocksAction();
}
@immutable
class NextUserUserBlocksSuccessAction extends UserUserBlockAction{
  final Iterable<UserUserBlockState> userUserBlocks;
  const NextUserUserBlocksSuccessAction({required this.userUserBlocks});
}
@immutable
class NextUserUserBlocksFailedAction extends UserUserBlockAction{
  const NextUserUserBlocksFailedAction();
}