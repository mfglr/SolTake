import 'package:flutter/material.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/topic_requests_state/topic_request_status.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_topic_requests_page/widgets/delete_topic_request_button/delelete_topic_request_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_topic_requests_page/widgets/topic_request_widget/topic_request_widget_constants.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_date_widget.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_row.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/request_status_widget/request_status_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class TopicRequestWidget extends StatelessWidget {
  final TopicRequestState topicRequest;
  const TopicRequestWidget({
    super.key,
    required this.topicRequest
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RequestDateWidget(dateTime: topicRequest.createdAt),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LanguageWidget(
                          child: (language) => RequestRow(
                            title: "${subjectName[language]!}:",
                            value: topicRequest.subjectName,
                          ),
                        ),
                        LanguageWidget(
                          child: (language) => RequestRow(
                            title: "${topicName[language]!}:",
                            value: topicRequest.name,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RequestStatusWidget(state: topicRequest.state)
              ],
            ),
            Row(
              children: [
                DeleleteTopicRequestButton(topicRequest: topicRequest,),
                if(topicRequest.state == TopicRequestStatus.rejected)
                  Expanded(
                    child: LanguageWidget(
                      child: (lanugage) => Text(
                        rejectionReasons[topicRequest.reason!][lanugage]!,
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