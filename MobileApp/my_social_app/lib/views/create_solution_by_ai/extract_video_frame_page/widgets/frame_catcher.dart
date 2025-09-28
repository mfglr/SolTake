import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/create_prompt_page.dart';
import 'package:my_social_app/views/create_solution_by_ai/extract_video_frame_page/widgets/catch_frame_button/catch_frame_button.dart';
import 'package:my_social_app/views/shared/slide_video_player/video_play_button.dart';
import 'package:my_social_app/views/shared/slide_video_player/video_progress_bar.dart';
import 'package:video_player/video_player.dart';

class FrameCatcher extends StatefulWidget {
  final Media media;
  final Widget? child;
  final String blobService;
  const FrameCatcher({
    super.key,
    required this.media,
    required this.blobService,
    this.child,
  });

  @override
  State<FrameCatcher> createState() => _FrameCatcherState();
}

class _FrameCatcherState extends State<FrameCatcher> {
  late final VideoPlayerController _controller;
  late final Uri _url;

  bool _displayVolumeState = false;
  bool _isVolumeOpen = true;
  void volumeUp(){
    _controller
      .setVolume(1.0)
      .then((_){
        setState(() {
          _isVolumeOpen = true;
          if(!_displayVolumeState){
            _displayVolumeState = true;
            Future
              .delayed(const Duration(seconds: 3))
              .then((_){
                if(mounted) setState(() => _displayVolumeState = false);
              });
          }
        });
      });
  }
  void volumeOff(){
    _controller
      .setVolume(0.0)
      .then((_){
        setState(() {
          _isVolumeOpen = false;
          if(!_displayVolumeState){
            _displayVolumeState = true;
            Future
              .delayed(const Duration(seconds: 3))
              .then((_){
                if(mounted) setState(() => _displayVolumeState = false);
              });
          }
        });
      });
  }

  @override
  void initState() {
    if(widget.media is RemoteVideo){
      final media = widget.media as RemoteVideo;
      _url = Uri.parse("${widget.blobService}/${media.containerName}/${media.blobName}");
      _controller = VideoPlayerController.networkUrl(_url);
    }
    else{
      final media = widget.media as LocalMedia;
      _controller = VideoPlayerController.file(media.file);
    }
    _controller.setLooping(true);
    _controller.initialize().then((_) => _controller.play().then((_) => setState(() {})));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isVolumeOpen ? volumeOff : volumeUp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AspectRatio(
                aspectRatio: widget.media.dimention.aspectRatio,
                child: VideoPlayer(_controller)
              ),
            ],
          ),
          CatchFrameButton(
            onPressed: (){
              var position = _controller.value.position.inMilliseconds.toDouble();
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => CreatePromptPage(
                  position: position,
                  media: widget.media,
                )))
                .then((value){
                  if(value != null && context.mounted){
                    Navigator
                      .of(context)
                      .pop((
                        prompt: value.prompt,
                        position: position,
                        isHighResulation: value.isHighResulation
                      ));
                  }
                });
            }
              
          ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(widget.child != null)
                    widget.child!,
                  Row(
                    children: [
                      // Expanded(
                      //   child: VideoProgressBar(
                      //     controller: _controller,
                      //     duration: Duration(seconds: widget.media.duration.round())
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: VideoPlayButton(controller: _controller)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          if(_displayVolumeState)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(102),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  _isVolumeOpen ? Icons.volume_up_sharp : Icons.volume_off_sharp,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}