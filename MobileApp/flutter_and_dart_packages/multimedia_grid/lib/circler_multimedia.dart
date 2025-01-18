import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';

class CirclerMultimedia extends StatefulWidget {
  final Multimedia? state;
  final String blobServiceUrl;
  final String noMediaPath;
  final String notFoundMediaPath;
  final Map<String,String>? headers;
  final double diameter;

  const CirclerMultimedia({
    super.key,
    required this.state,
    required this.blobServiceUrl,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    required this.diameter,
    this.headers,
  });

  @override
  State<CirclerMultimedia> createState() => _CirclerMultimediaState();
}

class _CirclerMultimediaState extends State<CirclerMultimedia> {
  late String _url;
  late Uint8List _image;
  late MultimediaStatus _status;
  
  void _setImage(){
    if(widget.state == null) return;
    
    if(widget.state!.multimediaType == MultimediaType.video){
      _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobNameOfFrame}";
    }
    else{
      _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobName}";
    }
    
    setState(() { _status = MultimediaStatus.started; }); 

    DefaultCacheManager()
      .getSingleFile(_url,headers: widget.headers)
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
          setState(() { _status = MultimediaStatus.notFound; });
        }
      });
  }

  @override
  void initState() {
    _setImage();
    super.initState();
  }

  @override
  void didUpdateWidget (CirclerMultimedia oldWidget) {
    if(oldWidget.state != widget.state){
      _setImage();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: Builder(
            builder: (context) {
              if(widget.state == null){
                return Image.asset(
                  widget.noMediaPath,
                  width: widget.diameter,
                  height: widget.diameter,
                  fit: BoxFit.cover,
                );
              }
              if(_status == MultimediaStatus.notFound){
                return Image.asset(
                  widget.notFoundMediaPath,
                  width: widget.diameter,
                  height: widget.diameter,
                  fit: BoxFit.cover,
                );
              }
              if(_status == MultimediaStatus.started){
                return SizedBox(
                  width: widget.diameter,
                  height: widget.diameter,
                  child: const Center(
                    child: CircularProgressIndicator()
                  ),
                );
              }
              return Image.memory(
                _image,
                fit: BoxFit.cover,
                height: widget.diameter,
                width: widget.diameter,
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
    );
  }
}