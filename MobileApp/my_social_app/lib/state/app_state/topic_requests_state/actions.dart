import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/topic_request_state.dart';

@immutable
class TopicRequestAction extends AppAction{
  const TopicRequestAction();
}

@immutable
class CreateTopicRequestAction extends TopicRequestAction{
  final SubjectState subject;
  final String name;
  const CreateTopicRequestAction({required this.subject, required this.name});
}
@immutable
class CreateTopicRequestSuccessAction extends TopicRequestAction{
  final TopicRequestState topicRequest;
  const CreateTopicRequestSuccessAction({required this.topicRequest});
}


@immutable
class DeleteTopicRequestAction extends TopicRequestAction{
  final int id;
  const DeleteTopicRequestAction({required this.id});
}
@immutable
class DeleteTopicRequestSuccessAction extends TopicRequestAction{
  final int id;
  const DeleteTopicRequestSuccessAction({required this.id});
}

@immutable
class NextTopicRequestsAction extends TopicRequestAction{
  const NextTopicRequestsAction();
}
@immutable
class NextTopicRequestsSuccessAction extends TopicRequestAction{
  final Iterable<TopicRequestState> topicRequests;
  const NextTopicRequestsSuccessAction({required this.topicRequests});
}
@immutable
class NextTopicRequestsFailedAction extends TopicRequestAction{
  const NextTopicRequestsFailedAction();
}


@immutable
class FirstTopicRequestsAction extends TopicRequestAction{
  const FirstTopicRequestsAction();
}
@immutable
class FirstTopicRequestsSuccessAction extends TopicRequestAction{
  final Iterable<TopicRequestState> topicRequests;
  const FirstTopicRequestsSuccessAction({required this.topicRequests});
}
@immutable
class FirstTopicRequestsFailedAction extends TopicRequestAction{
  const FirstTopicRequestsFailedAction();
}