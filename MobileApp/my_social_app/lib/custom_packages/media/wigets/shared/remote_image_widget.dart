import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/status_widgets/failed_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';

class RemoteImageWidget extends StatefulWidget {
  final String blobService;
  final RemoteImage media;
  final BoxFit fit;

  const RemoteImageWidget({
    super.key,
    required this.blobService,
    required this.media,
    this.fit = BoxFit.cover
  });

  @override
  State<RemoteImageWidget> createState() => _RemoteImageWidgetState();
}

class _RemoteImageWidgetState extends State<RemoteImageWidget> {
  late RemoteImage _media;

  @override
  void initState() {
    _media = widget.media;
    
    if(_media.status == MultimediaStatus.created){
      final url = "${widget.blobService}/${widget.media.containerName}/${widget.media.blobName}"; 
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
              setState(() =>_media = _media.noFound());
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
    return switch (_media.status){
      MultimediaStatus.created => const LoadingWidget(),
      MultimediaStatus.started => const LoadingWidget(),
      MultimediaStatus.completed => LayoutBuilder(
        builder: (context, constraints) => Image.memory(
          _media.bytes!,
          fit: widget.fit,
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
        ),
      ),
      MultimediaStatus.failed => const FailedWidget(),
      MultimediaStatus.notFound => const NotFoundWidget(),
    };
  }
}