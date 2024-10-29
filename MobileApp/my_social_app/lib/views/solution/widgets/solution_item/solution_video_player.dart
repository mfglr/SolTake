import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';
import 'package:my_social_app/views/shared/video_player/app_video_player.dart';
import 'package:video_player/video_player.dart';

class SolutionVideoPlayer extends StatefulWidget {
  final SolutionState solution;
  final VideoPlayerController? controller;
  final void Function(int solutionId) play;
  final void Function(int solutionId) pause;

  const SolutionVideoPlayer({
    super.key,
    required this.solution,
    required this.controller,
    required this.play,
    required this.pause,
  });

  @override
  State<SolutionVideoPlayer> createState() => _SolutionVideoPlayerState();
}

class _SolutionVideoPlayerState extends State<SolutionVideoPlayer> {
  
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoadSolutionImageAction(solutionId: widget.solution.id, index: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller == null
      ? DisplayImageWidget(
          onTap: () => widget.play(widget.solution.id),
          image: widget.solution.images.first.data,
          status: widget.solution.images.first.state,
          width: MediaQuery.of(context).size.width,
          aspectRatio: widget.solution.images.first.width / widget.solution.images.first.height,
          centerWidget: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: Icon(
                color: Colors.white,
                size: 60,
                Icons.play_circle_fill_outlined 
              ),
            ),
          ),
        )
      : AppVideoPlayer(
          controller: widget.controller!,
          aspectRatio: widget.solution.images.first.width / widget.solution.images.first.height,
          play: () => widget.play(widget.solution.id),
          pause: () => widget.pause(widget.solution.id),
          displayVolumeOffButton: true,
        );
  }
}