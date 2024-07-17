import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';

@immutable
class QuestionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int appUserId;
  final String userName;
  final String? content;
  final int examId;
  final int subjectId;
  final List<int> topics;
  final List<QuestionImageState> images;
  final bool isLiked;
  final int numberOfLikes;

  const QuestionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.examId,
    required this.subjectId,
    required this.topics,
    required this.images,
    required this.isLiked,
    required this.numberOfLikes
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  
  String formatContent()
    => 
    content != null ? 
      content!.length <= 25 ? 
        content! : 
        "${content!.substring(0,22)}..." :
      "Help Me!";

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
      subjectId: subjectId,
      topics: topics,
      images: _startLoadingImage(index),
      isLiked: isLiked,
      numberOfLikes: numberOfLikes
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
      subjectId: subjectId,
      topics: topics,
      images: _loadImage(index,image),
      isLiked: isLiked,
      numberOfLikes: numberOfLikes
    );

  QuestionState like()
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: true,
      numberOfLikes: numberOfLikes + 1
    );

  QuestionState dislike()
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: false,
      numberOfLikes: numberOfLikes - 1
    );
  
}
