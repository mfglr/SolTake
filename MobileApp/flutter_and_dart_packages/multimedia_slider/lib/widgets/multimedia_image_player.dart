import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';

class MultimediaImagePlayer extends StatefulWidget {
  final Multimedia? media;
  final String notFoundImagePath;
  final String noImagePath;
  final void Function() onInit;
  
  const MultimediaImagePlayer({
    super.key,
    required this.media,
    required this.notFoundImagePath,
    required this.noImagePath,
    required this.onInit
  });

  @override
  State<MultimediaImagePlayer> createState() => _MultimediaImagePlayerState();
}

class _MultimediaImagePlayerState extends State<MultimediaImagePlayer> {
  
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(widget.media == null){
          return Image.asset(
            width: MediaQuery.of(context).size.width,
            widget.noImagePath,
            fit: BoxFit.contain
          );
        }
        if(widget.media!.status == MultimediaStatus.success){
          return Image.memory(
            width: MediaQuery.of(context).size.width,
            widget.media!.data!,
            fit: BoxFit.contain
          );
        }
        if (widget.media!.status == MultimediaStatus.started) return const Center(child: CircularProgressIndicator());
        return Image.asset(
          widget.notFoundImagePath,
          fit: BoxFit.contain
        );
      }
    );
  }
}