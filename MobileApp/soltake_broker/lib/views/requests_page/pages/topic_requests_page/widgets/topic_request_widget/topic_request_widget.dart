import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:soltake_broker/views/requests_page/pages/topic_requests_page/widgets/approve_topic_request_button/approve_topic_request_button.dart';
import 'package:soltake_broker/views/requests_page/pages/topic_requests_page/widgets/reject_topic_request_button/reject_topic_request_button.dart';
import 'package:soltake_broker/views/requests_page/pages/topic_requests_page/widgets/topic_request_widget/topic_request_widget_constants.dart';
import 'package:soltake_broker/views/requests_page/widgets/request_date_widget.dart';
import 'package:soltake_broker/views/requests_page/widgets/request_row.dart';
import 'package:soltake_broker/views/requests_page/widgets/request_status_widget/request_status_widget.dart';
import 'package:soltake_broker/views/shared/language_widget.dart';

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
                ApproveTopicRequestButton(topicRequest: topicRequest,),
                RejectTopicRequestButton(topicRequest: topicRequest,)
              ],
            )
          ],
        ),
      ),
    );
  }
}