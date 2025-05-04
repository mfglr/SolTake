import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_media_grid.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_status_widget/upload_status_widget.dart';

class UploadItem extends StatelessWidget {
  final UploadState state;
  const UploadItem({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            UploadMediaGrid(files: state.medias), 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: UploadStatusWidget(state: state)
                    ),
                    Text("${(state.rate * 100).round()} %"),
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      value: state.rate,
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