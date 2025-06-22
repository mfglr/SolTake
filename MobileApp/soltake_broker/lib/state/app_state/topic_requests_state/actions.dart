import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';

@immutable
class TopicRequestAction extends AppAction{
  const TopicRequestAction();
}

@immutable
class ApproveTopicRequestAction extends TopicRequestAction{
  final int id;
  const ApproveTopicRequestAction({required this.id});
}
@immutable
class ApproveTopicRequestSuccessAction extends TopicRequestAction{
  final int id;
  const ApproveTopicRequestSuccessAction({required this.id});
}

@immutable
class RejectTopicRequestAction extends TopicRequestAction{
  final int id;
  final int reason;
  const RejectTopicRequestAction({
    required this.id,
    required this.reason
  });
}
@immutable
class RejectTopicRequestSuccessAction extends TopicRequestAction{
  final int id;
  const RejectTopicRequestSuccessAction({required this.id});
}


@immutable
class NextPendingTopicRequestsAction extends TopicRequestAction{
  const NextPendingTopicRequestsAction();
}
@immutable
class NextPendingTopicRequestsSuccessAction extends TopicRequestAction{
  final Iterable<TopicRequestState> topicRequests;
  const NextPendingTopicRequestsSuccessAction({required this.topicRequests});
}
@immutable
class NextPendingTopicRequestsFailedAction extends TopicRequestAction{
  const NextPendingTopicRequestsFailedAction();
}


@immutable
class FirstPendingTopicRequestsAction extends TopicRequestAction{
  const FirstPendingTopicRequestsAction();
}
@immutable
class FirstPendingTopicRequestsSuccessAction extends TopicRequestAction{
  final Iterable<TopicRequestState> topicRequests;
  const FirstPendingTopicRequestsSuccessAction({required this.topicRequests});
}
@immutable
class FirstPendingTopicRequestsFailedAction extends TopicRequestAction{
  const FirstPendingTopicRequestsFailedAction();
}