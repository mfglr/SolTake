import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';

class MultimediaGrid extends StatefulWidget {
  final Multimedia? state;
  final String blobServiceUrl;
  final String noMediaPath;
  final String notFoundMediaPath;
  final void Function()? onTap;
  final Map<String,String>? headers;
  final double aspectRatio;

  const MultimediaGrid({
    super.key,
    required this.state,
    required this.blobServiceUrl,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    this.onTap,
    this.headers,
    this.aspectRatio = 1
  });

  @override
  State<MultimediaGrid> createState() => _MultimediaGridState();
}

class _MultimediaGridState extends State<MultimediaGrid> {
  String? _url;
  Uint8List? _image;
  late MultimediaStatus _status;
  
  @override
  void initState() {
    if(widget.state != null){
      if(widget.state!.multimediaType == MultimediaType.video){
        _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobNameOfFrame}";
      }
      else{
        _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobName}";
      }
      _status = MultimediaStatus.started;
      DefaultCacheManager()
        .getSingleFile(_url!,headers: widget.headers)
        .then((file) => file.readAsBytes())
        .then((list){
          if(mounted){
            setState(() {
              _image = list;
              _status = MultimediaStatus.done;
            });
          }
        })
        .catchError((e){
          if(mounted){
            setState(() {
              _status = MultimediaStatus.notFound;
              throw e;
            });
          }
        });
    }  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Builder(
              builder: (context) {
                if(widget.state == null) return Image.asset(widget.noMediaPath);
                if(_status == MultimediaStatus.notFound) return Image.asset(widget.notFoundMediaPath);
                if(_status == MultimediaStatus.started) return  const Center( child: CircularProgressIndicator() );
                return Image.memory(
                  _image!,
                  fit: BoxFit.cover,
                );
              }
            )
          ),
          if(widget.state != null && widget.state!.multimediaType == MultimediaType.video)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(153),
                shape: BoxShape.circle
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 40,
              ),
            )
        ],
      ),
    );
  }
}