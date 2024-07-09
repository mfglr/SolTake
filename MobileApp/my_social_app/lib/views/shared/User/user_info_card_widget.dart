import 'package:flutter/material.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/states/user_state.dart';
import 'package:my_social_app/views/shared/Buttons/follow_button_widget.dart';
import 'package:my_social_app/views/shared/buttons/profile_edit_button.dart';
import 'package:my_social_app/views/shared/user/user_info_header_widget.dart';

class UserInfoCardWidget extends StatelessWidget {
  final UserState state;
  const UserInfoCardWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5,0,5,5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserInfoHeaderWidget(state: state),
          Builder(
            builder: (context) {
              if(AccountProvider().state!.id != state.id){
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: FollowButtonWidget(state: state,)
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  child: const Text("message")
                                ),
                                const Icon(Icons.message)
                              ],
                            ),
                          )
                        ),
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