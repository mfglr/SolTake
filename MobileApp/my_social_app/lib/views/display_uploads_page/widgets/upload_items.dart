import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/views/display_uploads_page/widgets/upload_item.dart';

class UploadItems extends StatelessWidget {
  final Iterable<UploadState> items;
  const UploadItems({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: items
          .map((item) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: UploadItem(state: item),
            )
          ))
          .toList(),
      ),
    );
  }
}