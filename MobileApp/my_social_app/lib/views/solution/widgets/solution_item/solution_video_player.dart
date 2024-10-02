import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/shared/video_player/app_video_player.dart';

class SolutionVideoPlayer extends StatefulWidget {
  final SolutionState solution;
  const SolutionVideoPlayer({
    super.key,
    required this.solution,
  });

  @override
  State<SolutionVideoPlayer> createState() => _SolutionVideoPlayerState();
}

class _SolutionVideoPlayerState extends State<SolutionVideoPlayer> {
  File? _file; 

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    DefaultCacheManager()
      .getSingleFile(
        "${dotenv.env['API_URL']}/api/$solutionController/$getSolutionVideoEndpoint/${widget.solution.id}",
        headers: { "Authorization": "Bearer ${store.state.accessToken}" }
      )
      .then((file){ setState(() { _file = file; }); });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _file == null 
      ? AspectRatio(
          aspectRatio: widget.solution.images.first.width / widget.solution.images.first.height,
          child: const LoadingWidget()
        )
      : AppVideoPlayer(
          file: _file!,
          id: widget.solution.id,
          aspectRatio: widget.solution.images.first.width / widget.solution.images.first.height,
          displayVolumeOffButton: true,
        );
  }
}