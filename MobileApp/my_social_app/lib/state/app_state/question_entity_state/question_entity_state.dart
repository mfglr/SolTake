import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class QuestionEntityState extends EntityState<QuestionState>{
  const QuestionEntityState({required super.entities});
  
  QuestionEntityState addQuestion(QuestionState value)
    => QuestionEntityState(entities: appendOne(value));
  QuestionEntityState addQuestions(Iterable<QuestionState> values)
    => QuestionEntityState(entities: appendMany(values));
  QuestionEntityState removeQuestion(int questionId)
    => QuestionEntityState(entities: removeOne(questionId));

  QuestionEntityState startLoadingNextLikes(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLodingNextLikes()));
  QuestionEntityState stopLoadingNextLikes(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextLikes()));
  QuestionEntityState addNextPageLikes(int questionId,Iterable<int> likeIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageLikes(likeIds)));
  QuestionEntityState like(int questionId,int likeId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.like(likeId)));
  QuestionEntityState dislike(int questionId,int likeId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.dislike(likeId)));
  QuestionEntityState addNewLike(int questionId,int likeId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewLike(likeId)));

  QuestionEntityState markSolutionAsCorrect(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.markSolutionAsCorrect(solutionId)));
  QuestionEntityState markSolutionAsIncorrect(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.markSolutionAsIncorrect(solutionId)));

  QuestionEntityState startLoadingNextSolutions(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextSolutions()));
  QuestionEntityState stopLoadingNextSolutions(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextSolutions()));
  QuestionEntityState addNextSolutions(int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextSolutions(solutionIds)));

  QuestionEntityState createNewSolution(SolutionState solution)
    => QuestionEntityState(entities: updateOne(entities[solution.questionId]?.createNewSolution(solution.id)));
  QuestionEntityState createNewVideoSolution(SolutionState solution)
    => QuestionEntityState(entities: updateOne(entities[solution.questionId]?.createNewVideoSolution(solution.id)));
  QuestionEntityState addNewSolution(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewSolution(solutionId)));
  QuestionEntityState removeSolution(SolutionState solution)
    => QuestionEntityState(entities: updateOne(entities[solution.questionId]?.removeSolution(solution)));

  QuestionEntityState startLoadingNextCorrectSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextCorrectSolutions()));
  QuestionEntityState addNextPageCorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageCorrectSolutions(solutionIds)));
  QuestionEntityState stopLoadingNextCorrectSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextCorrectSolutions()));

  QuestionEntityState startLoadingNextPendingSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextPendingSolutions()));
  QuestionEntityState stopLoadingNextPendingSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextPendingSolutions()));
  QuestionEntityState addNextPagePedingSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPedingSolutions(solutionIds)));

  QuestionEntityState startLoadingNextIncorrectSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadinNextIncorrectSolutions()));
  QuestionEntityState addNextPageIncorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextIncorrectSolutions(solutionIds)));
  QuestionEntityState stopLoadingIncorrectSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextIncorrectSolutions()));

  QuestionEntityState startLoadingNextVideoSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextVideoSolutions()));
  QuestionEntityState stopLoadingNextVideoSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.stopLodingNextVideoSolutions()));
  QuestionEntityState addNextVideoSolutions(int questionId, Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageVideoSolutions(solutionIds)));
  QuestionEntityState addVideoSolution(int questionId, int solutionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addVideoSolution(solutionId)));
  QuestionEntityState removeVideoSolution(int questionId, int solutionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.removeVideoSolution(solutionId)));

  QuestionEntityState startLoadingNextComments(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextComments()));
  QuestionEntityState stopLoadinNextComments(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.stopLoadingNextComments()));
  QuestionEntityState addNextPageComments(int questionId,Iterable<int> commentIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageComments(commentIds)));
  QuestionEntityState addComment(int questionId,int questionCommentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addComment(questionCommentId)));
  QuestionEntityState removeComment(int questionId,int commentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.removeComment(commentId)));
  QuestionEntityState addNewComment(int questionId,int commentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewComment(commentId)));

  QuestionEntityState startLoadingImage(int questionId,int index)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.startLoadingImage(index)));
  QuestionEntityState loadImage(int questionId,int index,Uint8List image)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.loadImage(index, image)));

  QuestionEntityState markAsSolved(int questionid)
    => QuestionEntityState(entities: entities[questionid] != null ? updateOne(entities[questionid]!.markAsSolved()) : entities);

  QuestionEntityState save(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.save()));
  QuestionEntityState unsave(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.unsave()));

  QuestionEntityState startUplodingVideoSolution(String id, int questionId,String? content,XFile video)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startUploadingVideoSolution(id, questionId, content, video)));
  QuestionEntityState startUploadingSolution(String id, int questionId,String? content,Iterable<XFile> images)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startUploadingSolution(id, questionId, content, images)));
  QuestionEntityState changeUploadingSolutionRate(UploadingSolutionState state, double rate)
    => QuestionEntityState(entities: updateOne(entities[state.questionId]?.changeUploadingSolutionRate(state, rate)));
  QuestionEntityState changeUploadingSolutionStatus(UploadingSolutionState state, UploadingFileStatus status)
    => QuestionEntityState(entities: updateOne(entities[state.questionId]?.changeUploadingSolutionStatus(state, status)));
  QuestionEntityState removeUploadedSolution(UploadingSolutionState state)
    => QuestionEntityState(entities: updateOne(entities[state.questionId]?.removeUploadedSolution(state)));
}