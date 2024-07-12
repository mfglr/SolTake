import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/buttons/follow_button_widget.dart';
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
          StoreConnector<AppState,AccountState?>(
            converter: (store) => store.state.accountState,
            builder: (context,accountState) {
              if(accountState!.id != state.id){
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