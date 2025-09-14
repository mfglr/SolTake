import 'package:flutter/material.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserState user;
  final Widget Function(UserState)? rigthButtonBuilder;
  final void Function(UserState)? onPressed;

  const UserItemWidget({
    super.key,
    required this.user,
    this.rigthButtonBuilder,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPageById(userId: user.id)));
            if(onPressed != null){
              onPressed!(user);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserImageWithNamesWidget(user: user),
              if(rigthButtonBuilder != null)
                rigthButtonBuilder!(user),
            ],
          ),
        ),
      ),
    );
  }
}