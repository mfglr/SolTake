import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:soltake_broker/views/requests_page/pages/subject_requests_page/widgets/subject_request_widget/subject_request_widget.dart';
import 'package:soltake_broker/views/shared/app_column.dart';

class SubjectRequestsWidget extends StatelessWidget {
  final Iterable<SubjectRequestState> subjectRequests;
  const SubjectRequestsWidget({
    super.key,
    required this.subjectRequests
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: subjectRequests.map((e) => SubjectRequestWidget(
        subjectRequest: e
      ))
    );
  }
}