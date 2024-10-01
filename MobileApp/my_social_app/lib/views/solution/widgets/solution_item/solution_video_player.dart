import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/solution_endpoints.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SolutionVideoPlayer extends StatefulWidget {
  final SolutionState solution;
  const SolutionVideoPlayer({
    super.key,
    required this.solution
  });

  @override
  State<SolutionVideoPlayer> createState() => _SolutionVideoPlayerState();
}

class _SolutionVideoPlayerState extends State<SolutionVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isSilenced = false;

  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    DefaultCacheManager()
      .getSingleFile(
        "${dotenv.env['API_URL']}/api/$solutionController/$getSolutionVideoEndpoint/${widget.solution.id}",
        headers: {
          "Authorization": "Bearer ${store.state.accessToken}",
        }
      )
      .then((file){
        _controller = VideoPlayerController.file(file);
        _controller
          .initialize()
          .then((_){
            setState(() {
              _isInitialized = true;
            });
          });
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized 
      ? GestureDetector(
        onTap: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: IconButton(
                onPressed: (){
                  _controller
                    .setVolume(_isSilenced ? 1 : 0)
                    .then((_){
                      setState(() {
                        _isSilenced = !_isSilenced;
                      });
                    });
                },
                icon: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      _isSilenced ? Icons.volume_off : Icons.volume_up,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ),
              )
            ),
            if(!_controller.value.isPlaying)
              Positioned(
                child: Container(
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
                )
              )
          ],
        ),
      ) 
      : SizedBox(
        height: widget.solution.images.first.height,
        width: widget.solution.images.first.width,
        child: const LoadingWidget()
      );
  }
}