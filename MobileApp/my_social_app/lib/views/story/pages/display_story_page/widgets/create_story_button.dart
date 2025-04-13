import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/views/create_story/pages/select_medias_page/select_medias_page.dart';

class CreateStoryButton extends StatelessWidget {
  const CreateStoryButton({super.key});

  void _createStory(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => const SelectMediasPage()))
      .then((appFiles){
        if(appFiles == null || !context.mounted) return;
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(CreateStoryAction(appFiles: appFiles));
        Navigator.of(context).pop();
      });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _createStory(context),
      icon: const Icon(
        Icons.add_a_photo,
      )
    );
  }
}