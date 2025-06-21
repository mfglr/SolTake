import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/subject_request_widget/subject_request_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

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