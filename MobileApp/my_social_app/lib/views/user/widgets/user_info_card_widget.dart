import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/profile_edit_button.dart';
import 'package:my_social_app/views/user/widgets/message_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_info_header_widget.dart';

class UserInfoCardWidget extends StatelessWidget {
  final UserState user;
  const UserInfoCardWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5,0,5,5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserInfoHeaderWidget(user: user),
          StoreConnector<AppState,AccountState?>(
            converter: (store) => store.state.accountState,
            builder: (context,accountState) {
              if(accountState!.id != user.id){
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: FollowButtonWidget(user: user,)
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: MessageButtonWidget(user: user)
                      ),
                    )
                  ],
                );
              }
              return const Row(
                children: [
                  Expanded(
                    child: ProfileEditButton()
                  ),
                ],
              );
            }
          )
        ],
      )
    );
  }
}