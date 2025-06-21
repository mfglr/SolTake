import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/delete_subject_request_button/delete_subject_requests_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/subject_request_status_widget/subject_requests_status_widget.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 15,
                    ),
                  ),
                  AppDateWidget(dateTime: subjectRequest.createdAt),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: LanguageWidget(
                            child: (language) => Text(
                              "${examName[language]!}:",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Text(
                          subjectRequest.examName
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: LanguageWidget(
                            child: (language) => Text(
                              "${subjectName[language]!}:",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Text(
                          subjectRequest.name
                        )
                      ],
                    ),
                  ],
                ),
                SubjectRequestsStatusWidget(subjectRequest: subjectRequest,)
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