import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/shared/video_player/app_video_player.dart';
import 'package:video_player/video_player.dart';

class SolutionVideoPlayer extends StatelessWidget {
  final SolutionState solution;
  final VideoPlayerController? controller;
  final void Function(int solutionId) play;
  final void Function(int solutionId) pause;

  const SolutionVideoPlayer({
    super.key,
    required this.solution,
    required this.controller,
    required this.play,
    required this.pause
  });

  @override
  Widget build(BuildContext context) {
    return controller == null 
      ? AspectRatio(
          aspectRatio: solution.images.first.width / solution.images.first.height,
          child: const LoadingWidget()
        )
      : AppVideoPlayer(
          controller: controller!,
          aspectRatio: solution.images.first.width / solution.images.first.height,
          play: () => play(solution.id),
          pause: () => pause(solution.id),
          displayVolumeOffButton: true,
        );
  }
}