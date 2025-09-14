import 'package:flutter/material.dart';
import 'package:my_social_app/state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/exam_request_widget/exam_request_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class ExamRequestsWidget extends StatelessWidget {
  final Iterable<ExamRequestState> examRequests;
  const ExamRequestsWidget({
    super.key,
    required this.examRequests
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: examRequests.map((e) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExamRequestWidget(
          examRequest: e
        ),
      )),
      margin: EdgeInsets.zero,
    );
  }
}