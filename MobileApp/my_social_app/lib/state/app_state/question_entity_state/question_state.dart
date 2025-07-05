import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

@immutable
class QuestionState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int state;
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
  final Pagination<int,Id<int>> comments;
  final Pagination<int,Id<int>> solutions;
  final Pagination<int,Id<int>> correctSolutions;
  final Pagination<int,Id<int>> pendingSolutions;
  final Pagination<int,Id<int>> incorrectSolutions;
  final Pagination<int,Id<int>> videoSolutions;

  @override
  int get avatarId => userId;
  @override
  Multimedia? get avatar => image;

  QuestionState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
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
    required this.comments,
    required this.solutions,
    required this.correctSolutions,
    required this.pendingSolutions,
    required this.incorrectSolutions,
    required this.videoSolutions,
  });

  QuestionState _optional({
    int? newState,
    String? newUserName,
    String? newContent,
    Iterable<Multimedia>? newMedias,
    bool? newIsLiked,
    bool? newIsSaved,
    int? newPublishingState,
    int? newNumberOfLikes,
    int? newNumberOfComments,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    int? newNumberOfVideoSolutions,
    Multimedia? newImage,
    Pagination<int,Id<int>>? newComments,
    Pagination<int,Id<int>>? newSolutions,
    Pagination<int,Id<int>>? newCorrectSolutions,
    Pagination<int,Id<int>>? newPendingSolutions,
    Pagination<int,Id<int>>? newIncorrectSolutions,
    Pagination<int,Id<int>>? newVideoSolutions,
  }) => 
    QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      state: newState ?? state,
      userId: userId,
      userName: newUserName ?? userName,
      content: newContent ?? content,
      exam: exam,
      subject: subject,
      topic: topic,
      medias: newMedias ?? medias,
      isLiked: newIsLiked ?? isLiked,
      isSaved: newIsSaved ?? isSaved,
      publishingState: newPublishingState ?? publishingState,
      isOwner: isOwner,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      numberOfVideoSolutions: newNumberOfVideoSolutions ?? numberOfVideoSolutions,
      comments: newComments ?? comments,
      solutions: newSolutions ?? solutions,
      correctSolutions: newCorrectSolutions ?? correctSolutions,
      pendingSolutions: newPendingSolutions ?? pendingSolutions,
      incorrectSolutions: newIncorrectSolutions ?? incorrectSolutions,
      videoSolutions: newVideoSolutions ?? videoSolutions,
      image: newImage ?? image,
    );

  String formatUserName(int count) => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  String? formatContent(int count){
    if(content == null) return null;
    return content!.length <= count ? content : "${content!.substring(0,count - 3)}...";
  }
  
  QuestionState startLodingNextLikes() => _optional();
  QuestionState stopLoadingNextLikes() => _optional();
  QuestionState addNextPageLikes(Iterable<QuestionUserLikeState> likes) => _optional();
  
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

  QuestionState markSolutionAsCorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.where((e) => e.id != solutionId),
      newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1,
      newCorrectSolutions: correctSolutions.addInOrder(Id(id: solutionId)),
      newState: QuestionStatus.solved
    );
  QuestionState markSolutionAsIncorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.where((e) => e.id != solutionId),
      newIncorrectSolutions: incorrectSolutions.addInOrder(Id(id: solutionId)),
    );

  QuestionState startLoadingNextSolutions() => 
    _optional(newSolutions: solutions.startLoadingNext());
  QuestionState addNextSolutions(Iterable<int> solutionIds) => 
    _optional(newSolutions: solutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextSolutions() =>
    _optional(newSolutions: solutions.stopLoadingNext());
  
  QuestionState createNewSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.prependOne(Id(id: solutionId)),
      newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId))
    );
  QuestionState createNewVideoSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: numberOfVideoSolutions + 1,
      newSolutions: solutions.prependOne(Id(id: solutionId)),
      newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId)),
      newVideoSolutions: videoSolutions.prependOne(Id(id: solutionId)),
    );
  QuestionState addNewSolution(int solutionId) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.addInOrder(Id(id: solutionId)),
      newPendingSolutions: pendingSolutions.addInOrder(Id(id: solutionId))
    );
  QuestionState removeSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? numberOfCorrectSolutions - 1
          : numberOfCorrectSolutions,
      newSolutions: solutions.where((e) => e.id != solution.id),
      newCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? correctSolutions.where((e) => e.id != solution.id) 
          : correctSolutions,
      newPendingSolutions: 
        solution.state == SolutionStatus.pending 
          ? pendingSolutions.where((e) => e.id != solution.id)
          : pendingSolutions,
      newIncorrectSolutions: 
        solution.state == SolutionStatus.incorrect
          ? incorrectSolutions.where((e) => e.id != solution.id)
          : incorrectSolutions,
      newNumberOfVideoSolutions: 
        solution.medias.any((e) => e.multimediaType == MultimediaType.video)
          ? numberOfVideoSolutions - 1
          : numberOfVideoSolutions,
      newVideoSolutions:
        solution.medias.any((e) => e.multimediaType == MultimediaType.video)
          ? videoSolutions.where((e) => e.id != solution.id)
          : videoSolutions,
      newState: 
        solution.state == SolutionStatus.correct && numberOfCorrectSolutions == 1
          ? QuestionStatus.unsolved
          : state,
    );

  QuestionState startLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.startLoadingNext());
  QuestionState addNextPageCorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newCorrectSolutions: correctSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.stopLoadingNext());

  QuestionState startLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.startLoadingNext());
  QuestionState addNextPagePedingSolutions(Iterable<int> solutionIds) =>
    _optional(newPendingSolutions: pendingSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.stopLoadingNext());

  QuestionState startLoadingNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.startLoadingNext());
  QuestionState stopLoadingNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.stopLoadingNext());
  QuestionState addNextIncorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newIncorrectSolutions: incorrectSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
 
  QuestionState startLoadingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.startLoadingNext());
  QuestionState stopLodingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.stopLoadingNext());
  QuestionState addNextPageVideoSolutions(Iterable<int> solutionIds) =>
    _optional(newVideoSolutions: videoSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState addVideoSolution(int solutionId) =>
    _optional(newVideoSolutions: videoSolutions.prependOne(Id(id: solutionId)));
  QuestionState removeVideoSolution(int solutionId) =>
    _optional(
      newVideoSolutions: videoSolutions.where((e) => e.id != solutionId)
    );

//comments ****************************************************
  QuestionState startLoadingNextComments() =>
    _optional(newComments: comments.startLoadingNext());
  QuestionState stopLoadingNextComments() =>
    _optional(newComments: comments.stopLoadingNext()); 
  QuestionState addNextPageComments(Iterable<int> commentIds) => 
    _optional(newComments: comments.addNextPage(commentIds.map((commentId) => Id(id: commentId))));
  
  QuestionState startLoadingPrevComments() =>
    _optional(newComments: comments.startLoadingPrev());
  QuestionState stopLoadingPrevComments() =>
    _optional(newComments: comments.stopLoadingPrev());
  QuestionState addPrevPageComments(Iterable<int> commentIds) =>
    _optional(newComments: comments.addPrevPage(commentIds.map((commentId) => Id(id: commentId))));

  QuestionState clear() =>
    _optional(newComments: comments.clear());

  QuestionState addComment(int commentId) =>
    _optional(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.prependOne(Id(id: commentId))
    );
  QuestionState removeComment(int commentId) =>
    _optional(
      newNumberOfComments: numberOfComments - 1,
      newComments: comments.where((e) => e.id != commentId)
    );
  QuestionState addNewComment(int commentId) =>
    _optional(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.addInOrder(Id(id: commentId))
    );
//comments ****************************************************



  QuestionState markAsSolved() => _optional(newState: QuestionStatus.solved);
  QuestionState save() => _optional(newIsSaved: true);
  QuestionState unsave() => _optional(newIsSaved: false);

}
