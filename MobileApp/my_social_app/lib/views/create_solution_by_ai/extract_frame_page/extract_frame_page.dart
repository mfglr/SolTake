import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/services/frame_catcher.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:rxdart/subjects.dart';
import 'extract_frame_page_constants.dart';

class ExtractFramePage extends StatefulWidget {
  final Media media;
  final String blobService;
  
  const ExtractFramePage({
    super.key,
    required this.media,
    required this.blobService
  });

  @override
  State<ExtractFramePage> createState() => _ExtractFramePageState();
}

class _ExtractFramePageState extends State<ExtractFramePage> {
  final BehaviorSubject<int> _positionSubject = BehaviorSubject<int>();
  
  void _extractFrame() =>
    _positionSubject.first
      .then(
        (positionMs) =>
          FrameCatcherService()
              .catchFrame(
                (widget.media as RemoteVideo).containerName,
                (widget.media as RemoteVideo).blobName,
                positionMs
              )
      )
      .then((bytes){
        if(mounted){
          Navigator.of(context).pop(bytes);
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: title[getLanguage(context)]!
        ),
        leading: const AppBackButtonWidget(),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: MediaWidget(
              media: widget.media,
              blobService: widget.blobService,
              positionSubject: _positionSubject,
              autoPlay: true,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(128),
              borderRadius: BorderRadius.circular(8)
            ),
            child: TextButton(
              onPressed: _extractFrame,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonContent[getLanguage(context)]!,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                  const Icon(
                    Icons.crop,
                    color: Colors.white,
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}