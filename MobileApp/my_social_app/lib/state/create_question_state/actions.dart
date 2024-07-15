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
class UpdateTopicIdsAction extends redux.Action{
  final List<int> topicIds;
  const UpdateTopicIdsAction({required this.topicIds});
}

@immutable
class UpdateContentAction extends redux.Action{
  final String content;
  const UpdateContentAction({required this.content});
}

@immutable
class ClearCreateStateAction extends redux.Action{
  const ClearCreateStateAction();
}