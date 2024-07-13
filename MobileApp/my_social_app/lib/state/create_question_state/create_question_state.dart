import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@immutable
class CreateQuestionState{
  final List<XFile> images;
  final int? examId;
  final int? subjectId;
  final List<int> topicIds;
  final String? content;

  const CreateQuestionState({
    required this.images,
    required this.examId,
    required this.subjectId,
    required this.topicIds,
    required this.content
  });

  CreateQuestionState addImage(XFile image)
    => CreateQuestionState(
        images: images.followedBy([image]).toList(),
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState changeActiveIndex(int activeIndex)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState removeImage(XFile image)
    => CreateQuestionState(
        images: images.where((e) => e != image).toList(),
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateContent(String content)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateExam(int examId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState updateSubject(int subjectId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState addTopicId(int topicId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds.followedBy([topicId]).toList(),
        content: content
      );
  CreateQuestionState removeTopicId(int topicId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds.where((e) => e != topicId).toList(),
        content: content
      );
}