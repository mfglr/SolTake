import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

@immutable
class QuestionState implements Avatar{
  final int id;
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
  final Pagination likes;
  final Pagination comments;
  final Pagination solutions;
  final Pagination correctSolutions;
  final Pagination pendingSolutions;
  final Pagination incorrectSolutions;
  final Pagination videoSolutions;

  @override
  int get avatarId => id;

  @override
  Multimedia? get avatar => image;

  const QuestionState({
    required this.id,
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
    Pagination? newLikes,
    Pagination? newComments,
    Pagination? newSolutions,
    Pagination? newCorrectSolutions,
    Pagination? newPendingSolutions,
    Pagination? newIncorrectSolutions,
    Pagination? newVideoSolutions,
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
      image: newImage ?? image
    );

  String formatUserName(int count) => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  String? formatContent(int count){
    if(content == null) return null;
    return content!.length <= count ? content : "${content!.substring(0,count - 3)}...";
  }
  
  QuestionState startLodingNextLikes() =>
    _optional(newLikes: likes.startLoadingNext());
  QuestionState stopLoadingNextLikes() =>
    _optional(newLikes: likes.stopLoadingNext());
  QuestionState addNextPageLikes(Iterable<int> likeIds) =>
    _optional(newLikes: likes.addNextPage(likeIds));
  QuestionState like(int likeId) => 
    _optional(
      newIsLiked: true,
      newLikes: likes.prependOne(likeId),
      newNumberOfLikes: numberOfLikes + 1
    ); 
  QuestionState dislike(int likeId) => 
    _optional(
      newIsLiked: false,
      newLikes: likes.removeOne(likeId),
      newNumberOfLikes: numberOfLikes - 1
    ); 
  QuestionState addNewLike(int likeId) =>
    _optional(
      newLikes: likes.addInOrder(likeId),
      newNumberOfLikes: numberOfLikes + 1
    );


  QuestionState markSolutionAsCorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.removeOne(solutionId),
      newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1,
      newCorrectSolutions: correctSolutions.addInOrder(solutionId),
      newState: QuestionStatus.solved
    );
  QuestionState markSolutionAsIncorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.removeOne(solutionId),
      newIncorrectSolutions: incorrectSolutions.addInOrder(solutionId),
    );

  QuestionState startLoadingNextSolutions() => 
    _optional(newSolutions: solutions.startLoadingNext());
  QuestionState addNextSolutions(Iterable<int> solutionIds) => 
    _optional(newSolutions: solutions.addNextPage(solutionIds));
  QuestionState stopLoadingNextSolutions() =>
    _optional(newSolutions: solutions.stopLoadingNext());
  QuestionState createNewSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.prependOne(solutionId),
      newPendingSolutions: pendingSolutions.prependOne(solutionId)
    );
  QuestionState createNewVideoSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: numberOfVideoSolutions + 1,
      newSolutions: solutions.prependOne(solutionId),
      newPendingSolutions: pendingSolutions.prependOne(solutionId),
      newVideoSolutions: videoSolutions.prependOne(solutionId),
    );
  QuestionState addNewSolution(int solutionId) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.addInOrder(solutionId),
      newPendingSolutions: pendingSolutions.addInOrder(solutionId)
    );
  QuestionState removeSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? numberOfCorrectSolutions - 1
          : numberOfCorrectSolutions,
      newSolutions: solutions.removeOne(solution.id),
      newCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? correctSolutions.removeOne(solution.id) 
          : correctSolutions,
      newPendingSolutions: 
        solution.state == SolutionStatus.pending 
          ? pendingSolutions.removeOne(solution.id)
          : pendingSolutions,
      newIncorrectSolutions: 
        solution.state == SolutionStatus.incorrect
          ? incorrectSolutions.removeOne(solution.id)
          : incorrectSolutions,
      newNumberOfVideoSolutions: 
        solution.medias.any((e) => e.multimediaType == MultimediaType.video)
          ? numberOfVideoSolutions - 1
          : numberOfVideoSolutions,
      newVideoSolutions:
        solution.medias.any((e) => e.multimediaType == MultimediaType.video)
          ? videoSolutions.removeOne(solution.id)
          : videoSolutions,
      newState: 
        solution.state == SolutionStatus.correct && numberOfCorrectSolutions == 1
          ? QuestionStatus.unsolved
          : state,
    );

  QuestionState startLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.startLoadingNext());
  QuestionState addNextPageCorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newCorrectSolutions: correctSolutions.addNextPage(solutionIds));
  QuestionState stopLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.stopLoadingNext());

  QuestionState startLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.startLoadingNext());
  QuestionState addNextPedingSolutions(Iterable<int> solutionIds) =>
    _optional(newPendingSolutions: pendingSolutions.addNextPage(solutionIds));
  QuestionState stopLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.stopLoadingNext());

  QuestionState startLoadinNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.startLoadingNext());
  QuestionState stopLoadingNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.stopLoadingNext());
  QuestionState addNextIncorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newIncorrectSolutions: incorrectSolutions.addNextPage(solutionIds));
 
  QuestionState startLoadingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.startLoadingNext());
  QuestionState stopLodingNextVideoSolutions() =>
    _optional(newVideoSolutions: videoSolutions.stopLoadingNext());
  QuestionState addNextPageVideoSolutions(Iterable<int> solutionIds) =>
    _optional(newVideoSolutions: videoSolutions.addNextPage(solutionIds));
  QuestionState addVideoSolution(int solutionId) =>
    _optional(newVideoSolutions: videoSolutions.prependOne(solutionId));
  QuestionState removeVideoSolution(int solutionId) =>
    _optional(newVideoSolutions: videoSolutions.removeOne(solutionId));

  QuestionState startLoadingNextComments() =>
    _optional(newComments: comments.startLoadingNext());
  QuestionState stopLoadingNextComments() =>
    _optional(newComments: comments.stopLoadingNext()); 
  QuestionState addNextPageComments(Iterable<int> commentIds) => 
    _optional(newComments: comments.addNextPage(commentIds));
  QuestionState addComment(int commentId) => 
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.prependOne(commentId));
  QuestionState removeComment(int commentId) =>
    _optional(newNumberOfComments: numberOfComments - 1,newComments: comments.removeOne(commentId));
  QuestionState addNewComment(int commentId) =>
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.addInOrder(commentId));

  QuestionState markAsSolved() =>
    _optional(newState: QuestionStatus.solved);
    
  QuestionState save() => _optional(newIsSaved: true);
  QuestionState unsave() => _optional(newIsSaved: false);

}
