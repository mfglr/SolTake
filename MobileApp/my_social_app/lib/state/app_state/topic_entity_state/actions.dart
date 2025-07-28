import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';


@immutable
class AddTopicAction extends AppAction{
  final TopicState topic;
  const AddTopicAction({required this.topic});
}
@immutable
class AddTopicsAction extends AppAction{
  final Iterable<TopicState> topics;
  const AddTopicsAction({required this.topics});
}
@immutable
class AddTopicsListAction extends AppAction{
  final Iterable<Iterable<TopicState>> lists;
  const AddTopicsListAction({required this.lists});
}