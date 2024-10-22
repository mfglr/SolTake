import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution/pages/add_solution_images_page/add_solution_images_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/create_solution/pages/create_video_solution_page/create_video_solution_page.dart';
import 'package:uuid/uuid.dart';

class CreateSolutionSpeedDial extends StatelessWidget {
  final int questionId;
  final PageController pageController;
  const CreateSolutionSpeedDial({
    super.key,
    required this.questionId,
    required this.pageController
  });

  void _createSolution(BuildContext context, value){
    final id = const Uuid().v4();
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateSolutionAction(id: id, questionId: questionId, content: value.content, images: value.images));
    pageController.animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _createVideoSolution(BuildContext context, value){
    final id = const Uuid().v4();
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(CreateVideoSolutionAction(id:id, questionId: questionId, content: value.content, video: value.video));
    pageController.animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

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
          onTap: () => 
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const AddSolutionImagesPage()))
              .then((value){
                if(value != null && context.mounted){
                  _createSolution(context,value);
                }
              })
        ),
        SpeedDialChild(
          child: const Icon(Icons.video_library),
          shape: const CircleBorder(),
          label: AppLocalizations.of(context)!.create_question_speed_dial_video_solution_label,
          backgroundColor: Colors.blue,
          onTap: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateVideoSolutionPage()))
              .then((value){
                if(value != null && context.mounted){
                  _createVideoSolution(context, value);
                }
              })
        )
      ],
    );
  }
}