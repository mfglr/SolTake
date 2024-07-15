import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';

@immutable
class LoadTopicsAction extends redux.Action{
  const LoadTopicsAction();
}

@immutable
class LoadTopicsSuccessAction extends redux.Action{
  final int subjectId;
  final List<TopicState> payload;
  const LoadTopicsSuccessAction({required this.subjectId,required this.payload});
}