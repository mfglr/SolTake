import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/story_state/actions.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/delete_story_modal/delete_story_modal.dart';

class StoryDeleteButton extends StatelessWidget {
  final StoryState story;
  final void Function() stopTimer;
  final void Function() startTimer;
  const StoryDeleteButton({
    super.key,
    required this.story,
    required this.stopTimer,
    required this.startTimer
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        stopTimer();
        showDialog<bool>(
          context: context,
          builder: (context) => const DeleteStoryModal()
        )
        .then((response){
          if(response != null && !response) startTimer();
          if(response == null || !response || !context.mounted) return;

          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(DeleteStoryAction(storyId: story.id));
          Navigator.of(context).pop();
        });
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      )
    );
  }
}