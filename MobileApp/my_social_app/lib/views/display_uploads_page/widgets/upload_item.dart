import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_item_image_player.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_item_video_player.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_status_widget.dart';

class UploadItem extends StatefulWidget {
  final UploadState state;
  const UploadItem({
    super.key,
    required this.state
  });

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  
  late final Iterable<AppFile> _topFourMedia;

  @override
  void initState() {
    _topFourMedia = widget.state.medias.take(4);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / (_topFourMedia.length == 2 ? 6 : 3),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _topFourMedia.length > 1 ? 2 : 1,
                ),
                itemCount: _topFourMedia.length,
                itemBuilder: (context,index){
                  var media = _topFourMedia.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Builder(builder: (context){
                      if(media.type == AppFileTypes.video) return UploadItemVideoPlayer(media: media);
                      return UploadItemImagePlayer(media: media);
                    }),
                  );
                }
              ),
            ), 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: UploadStatusWidget(state: widget.state)
                    ),
                    Text("${(widget.state.rate * 100).round()} %"),
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      value: widget.state.rate,
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}