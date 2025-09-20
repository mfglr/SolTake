import 'package:app_file_slider/widgets/play_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/failed_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/loading_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/not_found_widget.dart';

class RemoteVideoGridWidget extends StatefulWidget {
  final RemoteVideo media;
  final String blobService;
  const RemoteVideoGridWidget({
    super.key,
    required this.media,
    required this.blobService
  });

  @override
  State<RemoteVideoGridWidget> createState() => _RemoteVideoGridWidgetState();
}

class _RemoteVideoGridWidgetState extends State<RemoteVideoGridWidget> {
  late RemoteVideo _media;

  @override
  void initState() {
    _media = widget.media;
    if(_media.statusOfFrame == MultimediaStatus.created){
      _media = _media.start();
      final url = "${widget.blobService}/${widget.media.containerName}/${widget.media.blobNameOfFrame}";
      DefaultCacheManager()
        .getSingleFile(url)
        .then((file) => file.readAsBytes())
        .then((bytes){
          if(mounted){
            setState(() => _media = _media.complete(bytes));
          }
        })
        .catchError((e){
          if(mounted){
            setState(() {
              if(e is BackendException && e.statusCode == 404){
                setState(() => _media = _media.notFound());
              }
              setState(() => _media = _media.fail());
              throw e;
            });
          }
        });
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return switch(_media.statusOfFrame) {
      MultimediaStatus.created => const LoadingWidget(),
      MultimediaStatus.started => const LoadingWidget(),
      MultimediaStatus.completed => LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: Alignment.center,
          children: [
            Image.memory(
              _media.bytesOfFrame!,
              fit: BoxFit.cover,
              height: constraints.constrainHeight(),
              width: constraints.constrainWidth(),
            ),
            const PlayIcon()
          ],
        ),
      ),
      MultimediaStatus.failed => const FailedWidget(),
      MultimediaStatus.notFound => const NotFoundWidget()
    };
  }
}