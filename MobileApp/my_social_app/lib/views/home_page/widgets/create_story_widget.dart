import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/story_circle_state.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/select_medias_page.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/story/widgets/story_circle_widget.dart';

class CreateStoryWidget extends StatelessWidget {
  const CreateStoryWidget({super.key});

  void _createStory(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => const SelectMediasPage()))
      .then((appFiles){
        if(appFiles == null || !context.mounted) return;
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(CreateStoryAction(appFiles: appFiles));
      });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Iterable<StoryState>>(
      converter: (store) => selectCurrentUserStories(store),
      builder: (context,stories) => StoreConnector<AppState, UserState>(
        converter: (store) => store.state.currentUser!,
        builder: (context,user) => stories.isEmpty
          ? Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  UserImageWidget(
                    image: user.image,
                    diameter: 80,
                  ),
                  IconButton(
                    onPressed: () => _createStory(context),
                    icon: const Icon(
                      Icons.add_a_photo_rounded,
                      color: Colors.white,
                    )
                  ),
                ],
              ),
              Text(
                compressText(user.userName, 10),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
          : StoryCircleWidget(
              storyCircle: StoryCircleState(
                userId:  stories.first.userId,
                image:  stories.first.image,
                isViewed: !stories.any((e) => !e.isViewed),
                userName: stories.first.userName
              ),
              diameter: 80
            )
      ),
    );
  }
}