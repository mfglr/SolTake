import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/failed_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/loading_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/not_found_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/play_button.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';

class RemoteVideoFrameWidget extends StatefulWidget {
  final RemoteVideo media;
  final String blobService;
  final BoxFit fit;
  
  const RemoteVideoFrameWidget({
    super.key,
    required this.media,
    required this.blobService,
    this.fit = BoxFit.cover
  });

  @override
  State<RemoteVideoFrameWidget> createState() => _RemoteVideoFrameWidgetState();
}

class _RemoteVideoFrameWidgetState extends State<RemoteVideoFrameWidget> {
  late RemoteVideo _media;

  @override
  void initState() {
    _media = widget.media;
    
    if(_media.statusOfFrame == MultimediaStatus.created){
      final url = "${widget.blobService}/${widget.media.containerName}/${widget.media.blobNameOfFrame}"; 
      _media = _media.start();
      DefaultCacheManager()
        .getSingleFile(url)
        .then((file) => file.readAsBytes())
        .then(
          (list){
            if(mounted) setState(() =>_media = _media.complete(list));
          }
        )
        .catchError((e){
          if(mounted){
            if(e is BackendException && e.statusCode == 404){
              setState(() =>_media = _media.notFound());
            }
            else{
              setState(() =>_media = _media.fail());
            }
          }
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch (_media.statusOfFrame){
      MultimediaStatus.created => const LoadingWidget(),
      MultimediaStatus.started => const LoadingWidget(),
      MultimediaStatus.completed => LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.memory(
              _media.bytesOfFrame!,
              fit: widget.fit,
              height: constraints.constrainHeight(),
              width: constraints.constrainWidth(),
            ),
            const PlayButton()
          ],
        ),
      ),
      MultimediaStatus.failed => const FailedWidget(),
      MultimediaStatus.notFound => const NotFoundWidget(),
    };
  }
}