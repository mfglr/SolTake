import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/remote_image_widget/remote_image_completed_widget.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/remote_image_widget/remote_image_failed_widget.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/remote_image_widget/remote_image_loading_widget.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/remote_image_widget/remote_image_not_found_widget.dart';
import 'package:my_social_app/media/models/multimedia_status.dart';
import 'package:my_social_app/media/models/remote_image.dart';

class RemoteImageWidget extends StatefulWidget {
  final RemoteImage media;
  final String blobService;
  const RemoteImageWidget({
    super.key,
    required this.media,
    required this.blobService
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
      MultimediaStatus.created => RemoteImageLoadingWidget(media: _media),
      MultimediaStatus.started => RemoteImageLoadingWidget(media: _media),
      MultimediaStatus.processing => RemoteImageLoadingWidget(media: _media),
      MultimediaStatus.completed => RemoteImageCompletedWidget(media: _media),
      MultimediaStatus.failed => RemoteImageFailedWidget(media: _media),
      MultimediaStatus.notFound => RemoteImageNotFoundWidget(media: _media),
    };
  }
}