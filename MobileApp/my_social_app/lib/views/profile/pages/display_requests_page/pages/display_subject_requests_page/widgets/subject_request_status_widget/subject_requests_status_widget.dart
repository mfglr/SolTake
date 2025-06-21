import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'subject_requests_status_constants_widget.dart';

class SubjectRequestsStatusWidget extends StatelessWidget {
  final SubjectRequestState subjectRequest;
  const SubjectRequestsStatusWidget({
    super.key,
    required this.subjectRequest
  });

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (langauge) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FaIcon(
            icons[subjectRequest.state],
            color: colors[subjectRequest.state],
            size: 15,
          ),
          Text(
            status[subjectRequest.state][langauge]!,
            style: TextStyle(
              color: colors[subjectRequest.state]
            ),
          ),
        ],
      ),
    );
  }
}