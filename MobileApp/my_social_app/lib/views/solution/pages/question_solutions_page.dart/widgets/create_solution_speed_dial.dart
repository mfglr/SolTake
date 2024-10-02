import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/add_solution_images_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/create_solution/pages/display_video_solution_page/display_video_solution_page.dart';

class CreateSolutionSpeedDial extends StatelessWidget {
  final int questionId;
  const CreateSolutionSpeedDial({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.border_color,
      activeIcon: Icons.close,
      openCloseDial: ValueNotifier(false),
      spaceBetweenChildren: 15,
      direction: SpeedDialDirection.up,
      renderOverlay: true,
      buttonSize: const Size.fromRadius(30),
      animationCurve: Curves.bounceOut,
      animationDuration: const Duration(milliseconds: 200),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.photo),
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          onTap: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const AddSolutionImagesPage()))
              .then((value){
                if(value != null){
                  store.dispatch(CreateSolutionAction(
                    questionId: questionId, content: value.content, images: value.images
                  ));
                }
              });
          }
        ),
        SpeedDialChild(
          child: const Icon(Icons.video_library),
          shape: const CircleBorder(),
          label: AppLocalizations.of(context)!.create_question_speed_dial_video_solution_label,
          backgroundColor: Colors.blue,
          onTap: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const DisplayVideoSolutionPage()))
        )
      ],
    );
  }
}