import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia_grid/circler_multimedia.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';

class UserImageWidget extends StatefulWidget {
  final int userId;
  final Multimedia? image;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.userId,
    required this.image,
    required this.diameter,
    this.onPressed
  });

  @override
  State<UserImageWidget> createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoadUserImageAction(userId: widget.userId));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: CirclerMultimedia(
        diameter: widget.diameter,
        noMediaPath: "assets/images/no_profile_image.png",
        notFoundMediaPath: "assets/images/no_profile_image.png",
        state: widget.image,
      )
    );
  }
}



