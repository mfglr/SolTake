import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/questions_state/question_publishing_state.dart';
import 'package:my_social_app/state/questions_state/question_status.dart';
import 'package:my_social_app/state/question_user_likes_state/question_user_like_state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/topics_state/topic_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/solution_status.dart';

@immutable
class QuestionState<K extends Comparable> extends Entity<K> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int userId;
  final String userName;
  final String? content;
  final ExamState exam;
  final SubjectState subject;
  final TopicState? topic;
  final Iterable<Media> medias;
  final bool isLiked;
  final bool isSaved;
  final int publishingState;
  final bool isOwner;
  final int numberOfLikes;
  final int numberOfComments;
  final int numberOfSolutions;
  final int numberOfCorrectSolutions;
  final int numberOfVideoSolutions;
  final Multimedia? image;

  int get state => numberOfCorrectSolutions >= 1 ? QuestionStatus.solved : QuestionStatus.unsolved;
  @override
  int get avatarId => userId;
  @override
  Multimedia? get avatar => image;

  QuestionState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userName,
    required this.content,
    required this.exam,
    required this.subject,
    required this.topic,
    required this.medias,
    required this.isLiked,
    required this.isSaved,
    required this.publishingState,
    required this.isOwner,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.numberOfVideoSolutions,
    required this.image,
  });

  factory QuestionState.create({
    required K id,
    required int userId,
    required String userName,
    required String content,
    required ExamState exam,
    required SubjectState subject,
    required TopicState? topic,
    required Iterable<Media> medias,
    required Multimedia? image
  }) =>
    QuestionState<K>(
      id: id,
      createdAt: DateTime.now(),
      updatedAt: null,
      userId: userId,
      userName: userName,
      content: content,
      exam: exam,
      subject: subject,
      topic: topic,
      medias: medias,
      isLiked: false,
      isSaved: false,
      publishingState: QuestionPublishingState.notPublished,
      isOwner: true,
      numberOfLikes: 0,
      numberOfComments: 0,
      numberOfSolutions: 0,
      numberOfCorrectSolutions: 0,
      numberOfVideoSolutions: 0,
      image: image
    );

  QuestionState<K> _optional({
    bool? newIsLiked,
    bool? newIsSaved,
    int? newPublishingState,
    int? newNumberOfLikes,
    int? newNumberOfComments,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    int? newNumberOfVideoSolutions,
  }) => 
    QuestionState<K>(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
      userName: userName,
      content: content,
      exam: exam,
      subject: subject,
      topic: topic,
      medias: medias,
      isLiked: newIsLiked ?? isLiked,
      isSaved: newIsSaved ?? isSaved,
      publishingState: newPublishingState ?? publishingState,
      isOwner: isOwner,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      numberOfVideoSolutions: newNumberOfVideoSolutions ?? numberOfVideoSolutions,
      image: image,
    );


  String formatUserName(int count) => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  String? formatContent(int count){
    if(content == null) return null;
    return content!.length <= count ? content : "${content!.substring(0,count - 3)}...";
  }


  QuestionState<T> changeId<T extends Comparable>(T id) =>
    QuestionState<T>(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
      userName: userName,
      content: content,
      exam: exam,
      subject: subject,
      topic: topic,
      medias: medias,
      isLiked: isLiked,
      isSaved: isSaved,
      publishingState: publishingState,
      isOwner: isOwner,
      numberOfLikes: numberOfLikes,
      numberOfComments: numberOfComments,
      numberOfSolutions: numberOfSolutions,
      numberOfCorrectSolutions: numberOfCorrectSolutions,
      numberOfVideoSolutions: numberOfVideoSolutions,
      image: image
    ); 

  //solutions
  QuestionState<K> createSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: solution.hasVideo ? numberOfVideoSolutions + 1 : numberOfVideoSolutions,
    );
  QuestionState<K> deleteSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions:
        solution.state == SolutionStatus.correct
          ? numberOfCorrectSolutions - 1
          : numberOfCorrectSolutions,
      newNumberOfVideoSolutions:
        solution.hasVideo
          ? numberOfVideoSolutions - 1
          : numberOfVideoSolutions
    );
  QuestionState<K> markSolutionAsCorrect(SolutionState solution) =>
    _optional(newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1);
  QuestionState<K> markSolutionAsIncorrect(SolutionState solution) =>
    _optional(newNumberOfCorrectSolutions: numberOfCorrectSolutions - 1);
  //solutions

  QuestionState<K> like() =>
    _optional(
      newIsLiked: true,
      newNumberOfLikes: numberOfLikes + 1
    );
  QuestionState<K> dislike() => 
    _optional(
      newIsLiked: false,
      newNumberOfLikes: numberOfLikes - 1
    ); 
  
  QuestionState<K> addNewLike(QuestionUserLikeState like) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1
    );
  QuestionState<K> removeNewLike(int userId) =>
    _optional(
      newNumberOfLikes: numberOfLikes - 1
    );

  QuestionState<K> createNewSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      // newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId))
    );
  QuestionState<K> createNewVideoSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: numberOfVideoSolutions + 1,
      // newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId)),
    );
  QuestionState<K> addNewSolution(int solutionId) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      // newPendingSolutions: pendingSolutions.addInOrder(Id(id: solutionId))
    );
  QuestionState<K> removeSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? numberOfCorrectSolutions - 1
          : numberOfCorrectSolutions,
      newNumberOfVideoSolutions: 
        solution.medias.any((e) => e.multimediaType == MultimediaType.video)
          ? numberOfVideoSolutions - 1
          : numberOfVideoSolutions,
    );
 
  QuestionState<K> save() => _optional(newIsSaved: true);
  QuestionState<K> unsave() => _optional(newIsSaved: false);

  QuestionState<K> increaseNumberOfComments() => _optional(newNumberOfComments: numberOfComments + 1);
  QuestionState<K> decreaseNumberOfComments() => _optional(newNumberOfComments: numberOfComments - 1);

}
