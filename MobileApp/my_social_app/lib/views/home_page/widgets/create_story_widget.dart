import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/select_medias_page.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';

class CreateStoryWidget extends StatelessWidget {
  const CreateStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.currentUser!,
      builder: (context,user) =>
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            UserImageWidget(
              image: user.image,
              diameter: 80,
            ),
            IconButton(
              onPressed: () => Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => const SelectMediasPage())),
              icon: const Icon(
                Icons.add_a_photo_rounded,
                color: Colors.white,
              )
            ),
          ],
        ),
    );
  }
}