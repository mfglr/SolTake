import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class MultimediaImagePlayer extends StatefulWidget {
  final MultimediaState state;
  const MultimediaImagePlayer({
    super.key,
    required this.state
  });

  @override
  State<MultimediaImagePlayer> createState() => _MultimediaImagePlayerState();
}

class _MultimediaImagePlayerState extends State<MultimediaImagePlayer> {
  MultimediaStatus _status = MultimediaStatus.started;
  late final Uint8List _image;
  late final String url;

  @override
  void initState() {
    url = "${AppClient.apiUrl}/blobs/${widget.state.containerName}/${widget.state.blobName}";
    DefaultCacheManager()
      .getSingleFile(url)
      .then((file) => file.readAsBytes())
      .then((list) => setState(() {
        _image = list;
        _status = MultimediaStatus.done;
      }))
      .catchError((_) => setState(() {
        _status = MultimediaStatus.notFound;
      }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _status != MultimediaStatus.done 
      ? const LoadingCircleWidget()
      : Image.memory(_image, fit: BoxFit.contain);
  }
}