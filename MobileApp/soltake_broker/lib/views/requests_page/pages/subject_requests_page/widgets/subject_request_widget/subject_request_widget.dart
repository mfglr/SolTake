import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:soltake_broker/views/requests_page/pages/subject_requests_page/widgets/approve_subject_request_button/approve_subject_request_button.dart';
import 'package:soltake_broker/views/requests_page/pages/subject_requests_page/widgets/reject_subject_request_button/reject_subject_request_button.dart';
import 'package:soltake_broker/views/shared/app_date_widget.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';
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
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Column(
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
            ),
            Row(
              children: [
                ApproveSubjectRequestButton(subjectRequest: subjectRequest,),
                RejectSubjectRequestButton(subjectRequest: subjectRequest,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}