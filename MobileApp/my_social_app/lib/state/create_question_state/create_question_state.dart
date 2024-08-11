import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@immutable
class CreateQuestionState{
  final Iterable<XFile> images;
  final int? examId;
  final int? subjectId;
  final Iterable<int> topicIds;
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
        images: [...images, image],
        examId: examId,
        subjectId: subjectId,
        topicIds: topicIds,
        content: content
      );
  CreateQuestionState addImages(Iterable<XFile> images)
    => CreateQuestionState(
        images: [...this.images, ...images],
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
  CreateQuestionState updateExam(int examId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: null,
        topicIds: const [],
        content: content
      );
  CreateQuestionState updateSubject(int subjectId)
    => CreateQuestionState(
        images: images,
        examId: examId,
        subjectId: subjectId,
        topicIds: const [],
        content: content
      );
  CreateQuestionState updateTopicIds(Iterable<int> topicIds)
    => CreateQuestionState(
        images: images,
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
  CreateQuestionState clear()
    => const CreateQuestionState(
      images: [],
      examId: null,
      subjectId: null,
      topicIds: [],
      content: null
    );
}