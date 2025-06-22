import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/delete_subject_request_button/delete_subject_requests_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_date_widget.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_row.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_status_widget/request_status_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'subject_request_constants.dart';

class SubjectRequestWidget extends StatelessWidget {
  final SubjectRequestState subjectRequest;
  const SubjectRequestWidget({
    super.key,
    required this.subjectRequest
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RequestDateWidget(dateTime: subjectRequest.createdAt),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LanguageWidget(
                        child: (language) => RequestRow(
                          title: "${examName[language]!}:",
                          value: subjectRequest.examName
                        )
                      ),
                      LanguageWidget(
                        child: (language) => RequestRow(
                          title: "${subjectName[language]!}:",
                          value: subjectRequest.name
                        )
                      ),
                    ],
                  ),
                ),
                RequestStatusWidget(state: subjectRequest.state,)
              ],
            ),
            Row(
              children: [
                DeleteSubjectRequestsButton(subjectRequest: subjectRequest,),
                if(subjectRequest.reason != null)
                  LanguageWidget(
                    child: (language) => Text(
                      rejectionReasons[subjectRequest.reason!][language]!,
                      style: const TextStyle(
                        color: Colors.red
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}