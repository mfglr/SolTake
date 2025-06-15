import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/exam_request_widget/exam_request_widget_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class ExamRequestWidget extends StatelessWidget {
  final ExamRequestState examRequest;
  const ExamRequestWidget({
    super.key,
    required this.examRequest
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              LanguageWidget(
                child: (language) => Text(
                  examName[language]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                ),
              ),
              Text(
                examRequest.name,
                style: const TextStyle(
                  fontSize: 15
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}