import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_status.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/approve_exam_request_button/approve_exam_request_button.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/exam_request_widget/exam_request_widget_constants.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/exam_requests_status_widget/exam_requests_status_widget.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/reject_exam_request_button/reject_exam_request_button.dart';
import 'package:soltake_broker/views/shared/app_date_widget.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

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
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const FaIcon(
                      FontAwesomeIcons.clock,
                      size: 15,
                    ),
                  ),
                  AppDateWidget(dateTime: examRequest.createdAt),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
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
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                examRequest.name,
                                style: const TextStyle(
                                  color: Colors.black
                                ),
                              ),
                            ),
                          ]
                        ),
                    
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: LanguageWidget(
                                child: (language) => Text(
                                  "${initialism[language]!}:",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              examRequest.initialism,
                              style: const TextStyle(
                                color: Colors.black
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ExamRequestsStatusWidget(examRequest: examRequest)
              ],
            ),
            Row(
              children: [
                ApproveExamRequestButton(examRequest: examRequest),
                RejectExamRequestButton(examRequest: examRequest),
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