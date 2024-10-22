import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:video_player/video_player.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final firstImage = widget.solution.images?.firstOrNull;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if(firstImage != null)
          Image.file(
            File(firstImage.path),
            fit: BoxFit.cover,
          )
        else
          RotatedBox(
            quarterTurns: 1,
            child: VideoPlayer(_controller!)
          ),
        Positioned(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(widget.solution.rate >= 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Text(
                        AppLocalizations.of(context)!.uploading_solution_abstract_item,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    LoadingAnimationWidget.horizontalRotatingDots(
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: Colors.blue,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        value: widget.solution.rate,
                      ),
                    ),
                    Text(
                      "${(widget.solution.rate * 100).toStringAsFixed(2)}%",
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
            ],
          )
        )
      ],
    );
  }
}