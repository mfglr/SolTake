import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

@immutable
class QuestionState extends BaseEntity<num> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int state;
  final int userId;
  final String userName;
  final String? content;
  final int examId;
  final int subjectId;
  final int? topicId;
  final Iterable<Multimedia> medias;
  final bool isLiked;
  final bool isSaved;
  final bool isOwner;
  final int numberOfLikes;
  final int numberOfComments;
  final int numberOfSolutions;
  final int numberOfCorrectSolutions;
  final int numberOfVideoSolutions;
  final Multimedia? image;
  final Pagination<num,QuestionUserLikeState> likes;
  final Pagination<num,Id<num>> comments;
  final Pagination<num,Id<num>> solutions;
  final Pagination<num,Id<num>> correctSolutions;
  final Pagination<num,Id<num>> pendingSolutions;
  final Pagination<num,Id<num>> incorrectSolutions;
  final Pagination<num,Id<num>> videoSolutions;

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
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.medias,
    required this.isLiked,
    required this.isSaved,
    required this.isOwner,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.numberOfVideoSolutions,
    required this.image,
    required this.likes,
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
    int? newExamId,
    int? newSubjectId,
    int? newTopicId,
    Iterable<Multimedia>? newMedias,
    bool? newIsLiked,
    bool? newIsSaved,
    int? newNumberOfLikes,
    int? newNumberOfComments,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    int? newNumberOfVideoSolutions,
    Multimedia? newImage,
    Pagination<num,QuestionUserLikeState>? newLikes,
    Pagination<num,Id<num>>? newComments,
    Pagination<num,Id<num>>? newSolutions,
    Pagination<num,Id<num>>? newCorrectSolutions,
    Pagination<num,Id<num>>? newPendingSolutions,
    Pagination<num,Id<num>>? newIncorrectSolutions,
    Pagination<num,Id<num>>? newVideoSolutions,
  }) => 
    QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      state: newState ?? state,
      userId: userId,
      userName: newUserName ?? userName,
      content: newContent ?? content,
      examId: newExamId ?? examId,
      subjectId: newSubjectId ?? subjectId,
      topicId: newTopicId ?? topicId,
      medias: newMedias ?? medias,
      isLiked: newIsLiked ?? isLiked,
      isSaved: newIsSaved ?? isSaved,
      isOwner: isOwner,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      numberOfVideoSolutions: newNumberOfVideoSolutions ?? numberOfVideoSolutions,
      comments: newComments ?? comments,
      likes: newLikes ?? likes,
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
  
  QuestionState startLodingNextLikes() => _optional(newLikes: likes.startLoadingNext());
  QuestionState stopLoadingNextLikes() => _optional(newLikes: likes.stopLoadingNext());
  QuestionState addNextPageLikes(Iterable<QuestionUserLikeState> likes) => _optional(newLikes: this.likes.addNextPage(likes));
  QuestionState like(QuestionUserLikeState like) => 
    _optional(
      newIsLiked: true,
      newLikes: likes.prependOne(like),
      newNumberOfLikes: numberOfLikes + 1
    );
  QuestionState dislike(num userId) => 
    _optional(
      newIsLiked: false,
      newLikes: likes.where((e) => e.userId != userId),
      newNumberOfLikes: numberOfLikes - 1
    ); 
  QuestionState addNewLike(QuestionUserLikeState like) =>
    _optional(
      newLikes: likes.addInOrder(like),
      newNumberOfLikes: numberOfLikes + 1
    );

  QuestionState markSolutionAsCorrect(num solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.where((e) => e.id != solutionId),
      newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1,
      newCorrectSolutions: correctSolutions.addInOrder(Id(id: solutionId)),
      newState: QuestionStatus.solved
    );
  QuestionState markSolutionAsIncorrect(num solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.where((e) => e.id != solutionId),
      newIncorrectSolutions: incorrectSolutions.addInOrder(Id(id: solutionId)),
    );

  QuestionState startLoadingNextSolutions() => 
    _optional(newSolutions: solutions.startLoadingNext());
  QuestionState addNextSolutions(Iterable<num> solutionIds) => 
    _optional(newSolutions: solutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextSolutions() =>
    _optional(newSolutions: solutions.stopLoadingNext());
  
  QuestionState createNewSolution(num solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.prependOne(Id(id: solutionId)),
      newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId))
    );
  QuestionState createNewVideoSolution(num solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: numberOfVideoSolutions + 1,
      newSolutions: solutions.prependOne(Id(id: solutionId)),
      newPendingSolutions: pendingSolutions.prependOne(Id(id: solutionId)),
      newVideoSolutions: videoSolutions.prependOne(Id(id: solutionId)),
    );
  QuestionState addNewSolution(num solutionId) =>
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
  QuestionState addNextPageCorrectSolutions(Iterable<num> solutionIds) =>
    _optional(newCorrectSolutions: correctSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.stopLoadingNext());

  QuestionState startLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.startLoadingNext());
  QuestionState addNextPagePedingSolutions(Iterable<num> solutionIds) =>
    _optional(newPendingSolutions: pendingSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState stopLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.stopLoadingNext());

  QuestionState startLoadingNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.startLoadingNext());
  QuestionState stopLoadingNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.stopLoadingNext());
  QuestionState addNextIncorrectSolutions(Iterable<num> solutionIds) =>
    _optional(newIncorrectSolutions: incorrectSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
 
  QuestionState startLoadingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.startLoadingNext());
  QuestionState stopLodingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.stopLoadingNext());
  QuestionState addNextPageVideoSolutions(Iterable<num> solutionIds) =>
    _optional(newVideoSolutions: videoSolutions.addNextPage(solutionIds.map((solutionId) => Id(id: solutionId))));
  QuestionState addVideoSolution(num solutionId) =>
    _optional(newVideoSolutions: videoSolutions.prependOne(Id(id: solutionId)));
  QuestionState removeVideoSolution(num solutionId) =>
    _optional(
      newVideoSolutions: videoSolutions.where((e) => e.id != solutionId)
    );

  QuestionState startLoadingNextComments() =>
    _optional(newComments: comments.startLoadingNext());
  QuestionState stopLoadingNextComments() =>
    _optional(newComments: comments.stopLoadingNext()); 
  QuestionState addNextPageComments(Iterable<num> commentIds) => 
    _optional(newComments: comments.addNextPage(commentIds.map((commentId) => Id(id: commentId))));
  QuestionState addComment(num commentId) =>
    _optional(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.prependOne(Id(id: commentId))
    );
  QuestionState removeComment(num commentId) =>
    _optional(
      newNumberOfComments: numberOfComments - 1,
      newComments: comments.where((e) => e.id != commentId)
    );
  QuestionState addNewComment(num commentId) =>
    _optional(
      newNumberOfComments: numberOfComments + 1,
      newComments: comments.addInOrder(Id(id: commentId))
    );

  QuestionState markAsSolved() =>
    _optional(newState: QuestionStatus.solved);
    
  QuestionState save() => _optional(newIsSaved: true);
  QuestionState unsave() => _optional(newIsSaved: false);

}
