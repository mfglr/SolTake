import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
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

  void _changePage(){
    pageController
      .animateToPage(4, duration: const Duration(milliseconds: 300), curve: Curves.linear);
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
          onTap: () async {
            final store = StoreProvider.of<AppState>(context,listen: false);
            final value = await Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const AddSolutionImagesPage()));

            if(value != null){
              var images = value.images as Iterable<XFile>;
              final id = const Uuid().v4();
              store.dispatch(CreateSolutionAction(id: id, questionId: questionId, content: value.content, images: images));
              store.dispatch(StartUploadingSolutionAction(id:id, questionId: questionId,content: value.content,images: images));
              _changePage();
            }

          }
        ),
        SpeedDialChild(
          child: const Icon(Icons.video_library),
          shape: const CircleBorder(),
          label: AppLocalizations.of(context)!.create_question_speed_dial_video_solution_label,
          backgroundColor: Colors.blue,
          onTap: () async{
            final value = await Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateVideoSolutionPage()));
            if(value != null){
              if(context.mounted){
                final id = const Uuid().v4();
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(StartUploadingVideoSolutionAction(id:id, questionId: questionId, content: value.content, video: value.video));
                store.dispatch(CreateVideoSolutionAction(id: id, questionId: questionId, content: value.content, video: value.video));
                _changePage();
              }
            }
          }
        )
      ],
    );
  }
}