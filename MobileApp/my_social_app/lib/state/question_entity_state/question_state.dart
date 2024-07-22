import 'package:flutter/material.dart';

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
  final Iterable<int> topics;
  final Iterable<int> images;
  final bool isLiked;
  final int numberOfLikes;
  final bool isOwner;

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
    required this.numberOfLikes,
    required this.isOwner
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
      numberOfLikes: numberOfLikes + 1,
      isOwner: isOwner
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
      numberOfLikes: numberOfLikes - 1,
      isOwner: isOwner
    );
  
}
