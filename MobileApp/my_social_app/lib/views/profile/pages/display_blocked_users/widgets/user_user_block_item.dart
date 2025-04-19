import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/user_user_block_state/user_user_block_state.dart';
import 'package:my_social_app/views/profile/pages/display_blocked_users/widgets/un_block_button/unblock_button.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';

class UserUserBlockItem extends StatelessWidget {
  final UserUserBlockState userUserBlock;
  const UserUserBlockItem({
    super.key,
    required this.userUserBlock
  });

  @override
  Widget build(BuildContext context) {
    return UserItemWidget(
      onPressed: () => {},
      userItem: userUserBlock,
      rightWidget: UnblockButton(userUserBlock: userUserBlock),
    );
  }
}