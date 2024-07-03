import 'package:flutter/material.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/providers/user_image_provider.dart';
import 'package:provider/provider.dart';

class UserImageWidget extends StatelessWidget {

  final UserState state;
  final double diameter;
  const UserImageWidget({super.key, required this.state, required this.diameter});

  @override
  Widget build(BuildContext context) {
    context.read<UserImageProvider>().loadImage(state.id);
    final image = context.select((UserImageProvider u) => u.getImageById(state.id));
    

    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: Builder(
        builder: (context) {
          if(image != null) return Image.memory(image);
          return const CircularProgressIndicator();
        }
      ),
    );
  }
}

