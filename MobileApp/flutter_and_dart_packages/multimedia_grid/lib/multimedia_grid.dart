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
  final double aspectRatio;

  const MultimediaGrid({
    super.key,
    required this.state,
    required this.blobServiceUrl,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    this.onTap,
    this.aspectRatio = 1
  });

  @override
  State<MultimediaGrid> createState() => _MultimediaGridState();
}

class _MultimediaGridState extends State<MultimediaGrid> {
  String? _url;
  Multimedia? _media;
  
  @override
  void initState() {
    if(widget.state != null){
      if(widget.state!.multimediaType == MultimediaType.video){
        _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobNameOfFrame}";
      }
      else{
        _url = "${widget.blobServiceUrl}/${widget.state!.containerName}/${widget.state!.blobName}";
      }

      _media = widget.state!.start();

      DefaultCacheManager()
        .getSingleFile(_url!)
        .then((file) => file.readAsBytes())
        .then((list){
          if(mounted){
            setState(() => _media = _media!.done(list));
          }
        })
        .catchError((e){
          if(mounted){
            setState(() {
              setState(() => _media = _media!.notFound());
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
                if(_media == null) return Image.asset(widget.noMediaPath);
                if(_media!.status == MultimediaStatus.notFound) return Image.asset(widget.notFoundMediaPath);
                if(_media!.status == MultimediaStatus.started) return  const Center( child: CircularProgressIndicator() );
                return Image.memory(
                  _media!.data!,
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