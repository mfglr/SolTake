import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

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
  final int examId;
  const UpdateExamAction({required this.examId});
}

@immutable
class UpdateSubjectAction extends redux.Action{
  final int subjectId;
  const UpdateSubjectAction({required this.subjectId});
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
