import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';

class MultimediaImagePlayer extends StatefulWidget {
  final String blobServiceUrl;
  final Multimedia? media;
  final String notFoundImagePath;
  final String noImagePath;
  final Map<String,String>? headers;
  
  const MultimediaImagePlayer({
    super.key,
    required this.media,
    required this.blobServiceUrl,
    required this.notFoundImagePath,
    required this.noImagePath,
    this.headers
  });

  @override
  State<MultimediaImagePlayer> createState() => _MultimediaImagePlayerState();
}

class _MultimediaImagePlayerState extends State<MultimediaImagePlayer> {
  late MultimediaStatus _status;
  late final Uint8List _image;
  late final String url;
 
  @override
  void initState() {
    _status = MultimediaStatus.started;
    url = "${widget.blobServiceUrl}/${widget.media?.containerName}/${widget.media?.blobName}";
    
    DefaultCacheManager()
      .getSingleFile(url,headers: widget.headers)
      .then((file) => file.readAsBytes())
      .then((list) => setState(() {
        _image = list;
        _status = MultimediaStatus.done;
      }))
      .catchError((_) => setState(() { _status = MultimediaStatus.notFound; }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(widget.media == null) return Image.asset(widget.noImagePath,fit: BoxFit.contain);
        if(_status == MultimediaStatus.done) return Image.memory(_image,fit: BoxFit.contain);
        if (_status == MultimediaStatus.started) return const Center(child: CircularProgressIndicator());
        return Image.asset(
          widget.notFoundImagePath,
          fit: BoxFit.contain
        );
      }
    );
  }
}