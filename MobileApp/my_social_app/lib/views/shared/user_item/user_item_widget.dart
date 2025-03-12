import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/state/app_state/user_item.dart';

class UserItemWidget extends StatelessWidget {
  final UserItem userItem;
  final Widget? rightWidget;
  final void Function() onPressed;
  
  const UserItemWidget({
    super.key,
    this.rightWidget,
    required this.onPressed,
    required this.userItem
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: AppAvatar(
                      avatar: userItem,
                      diameter: 55
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userItem.userName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black
                        ),
                      ),
                      if(userItem.name != null)
                        Text(
                          userItem.name!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        )
                    ],
                  )
                ],
              ),
              if(rightWidget != null)
                rightWidget!
            ],
          ),
        ),
      ),
    );
  }
}