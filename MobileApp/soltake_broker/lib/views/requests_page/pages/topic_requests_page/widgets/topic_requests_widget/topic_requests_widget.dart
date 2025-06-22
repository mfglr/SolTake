import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:soltake_broker/views/requests_page/pages/topic_requests_page/widgets/topic_request_widget/topic_request_widget.dart';
import 'package:soltake_broker/views/shared/app_column.dart';

class TopicRequestsWidget extends StatelessWidget {
  final Iterable<TopicRequestState> topicRequests;
  
  const TopicRequestsWidget({
    super.key,
    required this.topicRequests
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: topicRequests.map((e) => TopicRequestWidget(topicRequest: e))
    );
  }
}