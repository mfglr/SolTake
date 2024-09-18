import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class CreateQuestionAction extends AppAction{
  const CreateQuestionAction();
}

@immutable
class CreateQuestionImageAction extends AppAction{
  final XFile image;
  const CreateQuestionImageAction({required this.image});
}
@immutable
class CreateQuestionImagesAction extends AppAction{
  final Iterable<XFile> images;
  const CreateQuestionImagesAction({required this.images});
}
@immutable
class RemoveQuestionImageAction extends AppAction{
  final XFile image;
  const RemoveQuestionImageAction({required this.image});
}

@immutable
class UpdateExamAction extends AppAction{
  final int examId;
  const UpdateExamAction({required this.examId});
}

@immutable
class UpdateSubjectAction extends AppAction{
  final int subjectId;
  const UpdateSubjectAction({required this.subjectId});
}

@immutable
class UpdateTopicIdsAction extends AppAction{
  final Iterable<int> topicIds;
  const UpdateTopicIdsAction({required this.topicIds});
}

@immutable
class UpdateContentAction extends AppAction{
  final String content;
  const UpdateContentAction({required this.content});
}

@immutable
class ClearCreateQuestionStateAction extends AppAction{
  const ClearCreateQuestionStateAction();
}