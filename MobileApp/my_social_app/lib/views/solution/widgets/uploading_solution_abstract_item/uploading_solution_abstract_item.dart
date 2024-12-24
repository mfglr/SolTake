import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_circle.dart';
import 'package:video_player/video_player.dart';

class UploadingSolutionAbstractItem extends StatefulWidget {
  final UploadingSolutionState solution;
  const UploadingSolutionAbstractItem({
    super.key,
    required this.solution
  });

  @override
  State<UploadingSolutionAbstractItem> createState() => _UploadingSolutionAbstractItemState();
}

class _UploadingSolutionAbstractItemState extends State<UploadingSolutionAbstractItem> {
  late final VideoPlayerController? _controller;
  
  @override
  void initState() {
    if(widget.solution.video != null){
      _controller = VideoPlayerController
        .file(File(widget.solution.video!.path))
        ..initialize();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firstImage = widget.solution.medias.firstOrNull;
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        if(firstImage != null)
          Image.file(
            File(firstImage.file.path),
            fit: BoxFit.cover,
          )
        else
          RotatedBox(
            quarterTurns: 1,
            child: VideoPlayer(_controller!)
          ),
        Positioned(
          child: UploadingCircle(
            status: widget.solution.status,
            rate: widget.solution.rate,
            onfailed: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              if(widget.solution.video != null){
                // store.dispatch(CreateVideoSolutionAction(
                //   id: widget.solution.id,
                //   questionId: widget.solution.questionId,
                //   content: widget.solution.content,
                //   video: widget.solution.video!
                // ));
              }
              else{
                store.dispatch(CreateSolutionAction(
                  id: widget.solution.id,
                  questionId: widget.solution.questionId,
                  content: widget.solution.content,
                  medias: widget.solution.medias
                ));
              }
            }
          )
        )
      ],
    );
  }
}


