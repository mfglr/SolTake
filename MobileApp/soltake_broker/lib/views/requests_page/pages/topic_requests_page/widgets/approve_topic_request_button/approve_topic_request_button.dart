import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/actions.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';

class ApproveTopicRequestButton extends StatelessWidget {
  final TopicRequestState topicRequest;
  const ApproveTopicRequestButton({
    super.key,
    required this.topicRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(ApproveTopicRequestAction(id: topicRequest.id));
      },
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      )
    );
  }
}