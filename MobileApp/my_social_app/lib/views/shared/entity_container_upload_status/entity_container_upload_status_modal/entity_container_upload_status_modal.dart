import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/shared/entity_container_upload_status/entity_container_upload_status.dart';
import 'entity_container_upload_status_modal_constants.dart';

class EntityContainerUploadStatusModal extends StatelessWidget {
  final EntityContainer container;
  final void Function() reUpload;
  const EntityContainerUploadStatusModal({
    super.key,
    required this.container,
    required this.reUpload
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          EntityContainerUploadStatus(
            container: container,
            diameter: 100,
            failedIconSize: 25,
            rateTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
          ),
          TextButton(
            onPressed: (){
              reUpload();
              Navigator.of(context).pop();
            },
            child: Text(
              content[getLanguage(context)]!,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}