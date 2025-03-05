import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class SearchUserWidget extends StatelessWidget {
  final SearchUserState state;
  const SearchUserWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: state.id))),
          child: Row(
            children: [
              AppAvatar(avatar: state, diameter: 55),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.userName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black
                    ),
                  ),
                  if(state.name != null)
                    Text(
                      state.name!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}