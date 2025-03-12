import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/profile_image_widget.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';

class AppAvatar extends StatelessWidget {
  final Avatar avatar;
  final double diameter;
  final void Function()? onPressed;
  
  const AppAvatar({
    super.key,
    required this.avatar,
    required this.diameter,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: StoreConnector<AppState,UserState>(
        converter: (store) => store.state.currentUser!,
        builder: (context,currentUser) => 
          avatar.avatarId == currentUser.id
            ? ProfileImageWidget(user: currentUser, diameter: diameter)
            : UserImageWidget(image: avatar.avatar, diameter: diameter)
      ),
    );
  }
}