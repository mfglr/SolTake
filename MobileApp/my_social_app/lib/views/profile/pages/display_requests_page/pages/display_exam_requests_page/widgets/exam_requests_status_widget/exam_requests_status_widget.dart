import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/exam_requests_status_widget/exam_requests_status_constants.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class ExamRequestsStatusWidget extends StatelessWidget {
  final ExamRequestState examRequest;
  const ExamRequestsStatusWidget({
    super.key,
    required this.examRequest
  });

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (langauge) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FaIcon(
            icons[examRequest.state],
            color: colors[examRequest.state],
            size: 15,
          ),
          Text(
            status[examRequest.state][langauge]!,
            style: TextStyle(
              color: colors[examRequest.state]
            ),
          ),
        ],
      ),
    );
  }
}