import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';
import 'package:my_social_app/state/question_entity_state/question_topic_state.dart';

@immutable
class QuestionState{
   final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int appUserId;
  final String userName;
  final String? content;
  final int examId;
  final String examName;
  final int subjectId;
  final String subjectName;
  final List<QuestionTopicState> topics;
  final List<QuestionImageState> images;

  const QuestionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.examId,
    required this.examName,
    required this.subjectId,
    required this.subjectName,
    required this.topics,
    required this.images
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  
  QuestionImageState get bigImage {
    var max = images[0];
    for(final image in images){
      if(image.height > max.height) max = image;
    }
    return max;
  }

  List<QuestionImageState> _startLoadingImage(int index){
    final List<QuestionImageState> clone = [];
    clone.addAll(images);
    
    clone[index] = clone[index].startLoading();
    return clone;
  }

  List<QuestionImageState> _loadImage(int index, Uint8List image){
    final List<QuestionImageState> clone = [];
    clone.addAll(images);
    clone[index] = clone[index].load(image);
    return clone;
  }

  QuestionState startLoadingImage(int index)
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      examName: examName,
      subjectId: subjectId,
      subjectName: subjectName,
      topics: topics,
      images: _startLoadingImage(index)
    );

  QuestionState loadImage(int index,Uint8List image)
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      examName: examName,
      subjectId: subjectId,
      subjectName: subjectName,
      topics: topics,
      images: _loadImage(index,image)
    );
}
