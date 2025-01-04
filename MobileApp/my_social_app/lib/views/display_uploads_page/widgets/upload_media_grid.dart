import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_item_image_player.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_item_video_player.dart';

class UploadMediaGrid extends StatefulWidget {
  final Iterable<AppFile> files;
  const UploadMediaGrid({
    super.key,
    required this.files
  });

  @override
  State<UploadMediaGrid> createState() => _UploadMediaGridState();
}

class _UploadMediaGridState extends State<UploadMediaGrid> {
  late final Iterable<AppFile> _topForMedias;

  @override
  void initState() {
    _topForMedias = widget.files.take(4);
    super.initState();
  }

  Widget _getMedia(AppFile media,{bool displayPlayIcon = true}){
    if(media.type == AppFileTypes.video) return UploadItemVideoPlayer(media: media,displayPlayIcon: displayPlayIcon);
    return UploadItemImagePlayer(media: media);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / (_topForMedias.length == 2 ? 6 : 3),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _topForMedias.length > 1 ? 2 : 1,
        ),
        itemCount: _topForMedias.length,
        itemBuilder: (context,index){
          var media = _topForMedias.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(1),
            child: Builder(builder: (context){
              if(index == 3 && widget.files.length > 4){
                return Stack(
                  alignment:  AlignmentDirectional.center,
                  fit: StackFit.expand,
                  children: [
                    _getMedia(media,displayPlayIcon: false),
                    Container(
                      color: Colors.black.withAlpha(153),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+${widget.files.length - 4}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return _getMedia(media);
            }),
          );
        }
      ),
    ); 
  }
}