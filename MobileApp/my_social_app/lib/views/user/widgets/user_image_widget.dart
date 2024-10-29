import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/image_state/image_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';

class UserImageWidget extends StatelessWidget {
  final int userId;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.userId,
    required this.diameter,
    this.onPressed
  });

  Widget _generateImage(UserImageState userImage){
    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: Builder(
        builder: (context) {
          if(userImage.state != ImageStatus.done){
            return Container(
              color: const Color.fromRGBO(226, 226, 226, 1),
            );
          }
          return Image.memory(
            userImage.image!,
            width: diameter,
            height: diameter,
            fit: BoxFit.cover,
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserImageState>(
      onInit: (store) => store.dispatch(LoadUserImageAction(userId: userId)),
      converter: (store) => store.state.userImageEntityState.entities[userId]!,
      builder:(context,userImage){
        if(onPressed == null) return _generateImage(userImage);
        return IconButton(
          onPressed: onPressed,
          icon: _generateImage(userImage)
        );
      }
    );
  }
}

