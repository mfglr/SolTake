import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/topic_request_state.dart';

class DeleleteTopicRequestButton extends StatelessWidget {
  final TopicRequestState topicRequest;
  const DeleleteTopicRequestButton({
    super.key,
    required this.topicRequest
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(DeleteTopicRequestAction(id: topicRequest.id));
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      )
    );
  }
}