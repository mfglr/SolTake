import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/wigets/failed_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/loading_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/not_found_widget.dart';

class RemoteImageGrid extends StatefulWidget {
  final RemoteImage media;
  final String baseUrl;
  const RemoteImageGrid({
    super.key,
    required this.media,
    required this.baseUrl
  });

  @override
  State<RemoteImageGrid> createState() => _RemoteImageGridState();
}

class _RemoteImageGridState extends State<RemoteImageGrid> {
  late RemoteImage _media;

  @override
  void initState() {
    _media = widget.media;
    if(_media.status == MultimediaStatus.created){
      _media = _media.start();
      final url = "${widget.baseUrl}/${widget.media.containerName}/${widget.media.blobName}";
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
                setState(() => _media = _media.noFound());
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
    return switch(_media.status) {
      MultimediaStatus.created => const LoadingWidget(),
      MultimediaStatus.started => const LoadingWidget(),
      MultimediaStatus.completed => LayoutBuilder(
        builder: (context, constraints) => Image.memory(
          _media.bytes!,
          fit: BoxFit.cover,
          width: constraints.constrainWidth(),
          height: constraints.constrainWidth(),
        ),
      ),
      MultimediaStatus.failed => const FailedWidget(),
      MultimediaStatus.notFound => const NotFoundWidget()
    };
  }
}