import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/create_question_state/create_question_state.dart';

@immutable
class AddImageAction extends redux.Action{
  final XFile image;
  const AddImageAction({required this.image});
}

@immutable
class RemoveImageAction extends redux.Action{
  final XFile image;
  const RemoveImageAction({required this.image});
}

@immutable
class UpdateContentAction extends redux.Action{
  final String content;
  const UpdateContentAction({required this.content});
}

@immutable
class UpdateExamAction extends redux.Action{
  final Exam exam;
  const UpdateExamAction({required this.exam});
}

@immutable
class UpdateSubjectAction extends redux.Action{
  final Subject subject;
  const UpdateSubjectAction({required this.subject});
}

@immutable
class AddTopicIdAction extends redux.Action{
  final int topicId;
  const AddTopicIdAction({required this.topicId});
}

@immutable
class RemoveTopicIdAction extends redux.Action{
  final int topicId;
  const RemoveTopicIdAction({required this.topicId});
}
