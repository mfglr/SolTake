import 'package:flutter/material.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_status.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/delete_exam_request_button/delete_exam_requests.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/exam_request_widget/exam_request_widget_constants.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_date_widget.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_row.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_status_widget/request_status_widget.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RequestDateWidget(dateTime: examRequest.createdAt,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LanguageWidget(
                        child: (language) => RequestRow(
                          title: "${examName[language]!}:",
                          value: examRequest.name,
                        ),
                      ),
                      LanguageWidget(
                        child: (language) => RequestRow(
                          title: "${initialism[language]!}:",
                          value: examRequest.initialism,
                        ),
                      ),
                    ],
                  ),
                ),
                RequestStatusWidget(state: examRequest.state)
              ],
            ),
            
            Row(
              children: [
                DeleteExamRequests(examRequest: examRequest,),
                if(examRequest.state == ExamRequestStatus.rejected)
                  Expanded(
                    child: LanguageWidget(
                      child: (lanugage) => Text(
                        rejectionReasons[examRequest.reason!][lanugage]!,
                        style: const TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}