import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class UserImageWidget extends StatelessWidget {

  final UserState state;
  final double diameter;
  const UserImageWidget({super.key, required this.state, required this.diameter});

  @override
  Widget build(BuildContext context) {
    store.dispatch(LoadUserImageAction(userId: state.id));

    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: StoreConnector<AppState,Uint8List?>(
        converter: (store) => store.state.userEntityState.users[state.id]!.image,
        builder: (context,image) {
          if(image != null) return Image.memory(image);
          return const CircularProgressIndicator();
        }
      )
    );
  }
}

