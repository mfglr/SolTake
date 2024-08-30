import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class QuestionEntityState extends EntityState<QuestionState>{
  const QuestionEntityState({required super.containers});
  
  QuestionEntityState addQuestion(QuestionState value)
    => QuestionEntityState(containers: appendOne(value));
  QuestionEntityState addQuestions(Iterable<QuestionState> values)
    => QuestionEntityState(containers: appendMany(values));
  
  QuestionEntityState startLoadingNextLikes(int questionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.startLodingNextLikes()));
  QuestionEntityState addNextPageLikes(int questionId,Iterable<int> likeIds)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPageLikes(likeIds)));
  QuestionEntityState like(int questionId,int likeId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.like(likeId)));
  QuestionEntityState dislike(int questionId,int likeId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.dislike(likeId)));
  QuestionEntityState addNewLike(int questionId,int likeId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNewLike(likeId)));

  QuestionEntityState markSolutionAsCorrect(int questionId,int solutionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.markSolutionAsCorrect(solutionId)));
  QuestionEntityState markSolutionAsIncorrect(int questionId,int solutionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.markSolutionAsIncorrect(solutionId)));

  QuestionEntityState getNextPageSolutions(int questionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.startLoadingNextSolutions()));
  QuestionEntityState addNextPageSolutions(int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPageSolutions(solutionIds)));
  QuestionEntityState createNewSolution(SolutionState solution)
    => QuestionEntityState(containers: updateOne(containers[solution.questionId]?.entity.createNewSolution(solution.id)));
  QuestionEntityState addNewSolution(int questionId,int solutionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNewSolution(solutionId)));
  QuestionEntityState removeSolution(SolutionState solution)
    => QuestionEntityState(containers: updateOne(containers[solution.questionId]?.entity.removeSolution(solution)));

  QuestionEntityState getNextPageCorrectSolutions(int questionId) =>
    QuestionEntityState(containers: updateOne(containers[questionId]?.entity.startLoadingNextCorrectSolutions()));
  QuestionEntityState addNextPageCorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPageCorrectSolutions(solutionIds)));

  QuestionEntityState startLoadingNextPendingSolutions(int questionId) =>
    QuestionEntityState(containers: updateOne(containers[questionId]?.entity.startLoadingNextPendingSolutions()));
  QuestionEntityState addNextPagePedingSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPagePedingSolutions(solutionIds)));

  QuestionEntityState startLoadingNextIncorrectSolutions(int questionid) =>
    QuestionEntityState(containers: updateOne(containers[questionid]?.entity.startLoadinNextIncorrectSolutions()));
  QuestionEntityState addNextPageIncorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPageIncorrectSolutions(solutionIds)));

  
  QuestionEntityState getNextPageComments(int questionId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.startLoadingNextComments()));
  QuestionEntityState addNextPageComments(int questionId,Iterable<int> commentIds)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNextPageComments(commentIds)));
  QuestionEntityState addComment(int questionId,int questionCommentId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addComment(questionCommentId)));
  QuestionEntityState removeComment(int questionId,int commentId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.removeComment(commentId)));
  QuestionEntityState addNewComment(int questionId,int commentId)
    => QuestionEntityState(containers: updateOne(containers[questionId]?.entity.addNewComment(commentId)));

  QuestionEntityState startLoadingImage(int questionId,int index)
    => QuestionEntityState(containers: updateOne(containers[questionId]!.entity.startLoadingImage(index)));
  QuestionEntityState loadImage(int questionId,int index,Uint8List image)
    => QuestionEntityState(containers: updateOne(containers[questionId]!.entity.loadImage(index, image)));

  QuestionEntityState markAsSolved(int questionid)
    => QuestionEntityState(containers: containers[questionid] != null ? updateOne(containers[questionid]!.entity.markAsSolved()) : containers);
}