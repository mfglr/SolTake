import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/app_state/questions_state/question_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

@immutable
class QuestionState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int userId;
  final String userName;
  final String? content;
  final ExamState exam;
  final SubjectState subject;
  final TopicState? topic;
  final Iterable<Multimedia> medias;
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

  QuestionState _optional({
    bool? newIsLiked,
    bool? newIsSaved,
    int? newPublishingState,
    int? newNumberOfLikes,
    int? newNumberOfComments,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    int? newNumberOfVideoSolutions,
  }) => 
    QuestionState(
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


  //solutions
  QuestionState createSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: solution.hasVideo ? numberOfVideoSolutions + 1 : numberOfVideoSolutions,
    );
  QuestionState deleteSolution(SolutionState solution) =>
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
  QuestionState markSolutionAsCorrect(SolutionState solution) =>
    _optional(newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1);
  QuestionState markSolutionAsIncorrect(SolutionState solution) =>
    _optional(newNumberOfCorrectSolutions: numberOfCorrectSolutions - 1);
  //solutions

  QuestionState like() =>
    _optional(
      newIsLiked: true,
      newNumberOfLikes: numberOfLikes + 1
    );
  QuestionState dislike() => 
    _optional(
      newIsLiked: false,
      newNumberOfLikes: numberOfLikes - 1
    ); 
  
  QuestionState addNewLike(QuestionUserLikeState like) =>
    _optional(
      newNumberOfLikes: numberOfLikes + 1
    );
  QuestionState removeNewLike(int userId) =>
    _optional(
      newNumberOfLikes: numberOfLikes - 1
    );

  QuestionState createNewSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      // newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId))
    );
  QuestionState createNewVideoSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: numberOfVideoSolutions + 1,
      // newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId)),
    );
  QuestionState addNewSolution(int solutionId) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      // newPendingSolutions: pendingSolutions.addInOrder(Id(id: solutionId))
    );
  QuestionState removeSolution(SolutionState solution) =>
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
 
  QuestionState save() => _optional(newIsSaved: true);
  QuestionState unsave() => _optional(newIsSaved: false);

  QuestionState increaseNumberOfComments() => _optional(newNumberOfComments: numberOfComments + 1);

}
