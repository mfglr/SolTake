import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/exam_request_widget/exam_request_widget.dart';
import 'package:soltake_broker/views/shared/app_column.dart';

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