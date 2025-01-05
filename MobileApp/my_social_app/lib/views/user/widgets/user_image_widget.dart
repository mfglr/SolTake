import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';

class UserImageWidget extends StatefulWidget {
  final int userId;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.userId,
    required this.diameter,
    this.onPressed
  });

  @override
  State<UserImageWidget> createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {

  
  @override
  void initState() {


    super.initState();
  }

  Widget _generateImage(UserImageState userImage){
    return Container(
      width: widget.diameter,
      height: widget.diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: Builder(
        builder: (context) {
          if(userImage.state != MultimediaStatus.done){
            return Container(
              color: const Color.fromRGBO(226, 226, 226, 1),
            );
          }
          return Image.memory(
            userImage.image!,
            width: widget.diameter,
            height: widget.diameter,
            fit: BoxFit.cover,
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserImageState>(
      onInit: (store) => store.dispatch(LoadUserImageAction(userId: widget.userId)),
      converter: (store) => store.state.userImageEntityState.entities[widget.userId]!,
      builder:(context,userImage){
        if(widget.onPressed == null) return _generateImage(userImage);
        return IconButton(
          onPressed: widget.onPressed,
          icon: _generateImage(userImage)
        );
      }
    );
  }
}

