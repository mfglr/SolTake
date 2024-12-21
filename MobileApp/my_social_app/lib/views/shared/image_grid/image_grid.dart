import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class ImageGrid extends StatefulWidget {
  final MultimediaState state;
  final void Function()? onTap;
  const ImageGrid({
    super.key,
    required this.state,
    this.onTap
  });

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  late final String _url;
  Uint8List? _image;
  MultimediaStatus _status = MultimediaStatus.notStarted;
  
  @override
  void initState() {
    if(widget.state.multimediaType == MultimediaType.video){
      _url = "${AppClient.apiUrl}/blobs/${widget.state.containerName}/${widget.state.blobNameOfFrame}";
    }
    else{
      _url = "${AppClient.apiUrl}/blobs/${widget.state.containerName}/${widget.state.blobName}";
    }
    DefaultCacheManager()
      .getSingleFile(_url)
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
    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: _status != MultimediaStatus.done
          ? const LoadingCircleWidget()
          : Image.memory(
            _image!,
            fit: BoxFit.cover,
          )
      ),
    );
  }
}