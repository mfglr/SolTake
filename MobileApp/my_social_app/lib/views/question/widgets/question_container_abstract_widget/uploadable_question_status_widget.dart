import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/upload_status.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';


class UploadableQuestionStatusWidget extends StatelessWidget {
  static const _icons = <UploadStatus, IconData>{
    UploadStatus.uploading: Icons.upload,
    UploadStatus.processing: Icons.settings,
    UploadStatus.failed: Icons.close
  };

  final UploadableContainer<String, QuestionState<String>> container;
  
  const UploadableQuestionStatusWidget({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        children: [
          Text(
            container.rateToString,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
          Icon(
            _icons[container.status],
            color: Colors.white,
          )
        ],
      )
    );
  }
}