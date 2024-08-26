import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class QuestionEntityState extends EntityState<QuestionState>{
  const QuestionEntityState({required super.entities});
  
  QuestionEntityState addQuestion(QuestionState value)
    => QuestionEntityState(entities: appendOne(value));
  QuestionEntityState addQuestions(Iterable<QuestionState> values)
    => QuestionEntityState(entities: appendMany(values));
  
  QuestionEntityState like(int questionId,int currentUserId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.like(currentUserId)));
  QuestionEntityState dislike(int questionId,int currentUserId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.dislike(currentUserId)));
  QuestionEntityState addNewLike(int questionId,int userId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewLike(userId)));
  QuestionEntityState startLoadingNextLikes(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLodingNextLikes()));
  QuestionEntityState addNextPageLikes(int questionId,Iterable<int> userIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageLikes(userIds)));

  QuestionEntityState markSolutionAsCorrect(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.markSolutionAsCorrect(solutionId)));
  QuestionEntityState markSolutionAsIncorrect(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.markSolutionAsIncorrect(solutionId)));

  QuestionEntityState getNextPageSolutions(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextSolutions()));
  QuestionEntityState addNextPageSolutions(int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageSolutions(solutionIds)));
  QuestionEntityState createNewSolution(SolutionState solution)
    => QuestionEntityState(entities: updateOne(entities[solution.questionId]?.createNewSolution(solution.id)));
  QuestionEntityState addNewSolution(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewSolution(solutionId)));
  QuestionEntityState removeSolution(SolutionState solution)
    => QuestionEntityState(entities: updateOne(entities[solution.questionId]?.removeSolution(solution)));

  QuestionEntityState getNextPageCorrectSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextCorrectSolutions()));
  QuestionEntityState addNextPageCorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageCorrectSolutions(solutionIds)));

  QuestionEntityState startLoadingNextPendingSolutions(int questionId) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextPendingSolutions()));
  QuestionEntityState addNextPagePedingSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPagePedingSolutions(solutionIds)));

  QuestionEntityState startLoadingNextIncorrectSolutions(int questionid) =>
    QuestionEntityState(entities: updateOne(entities[questionid]?.startLoadinNextIncorrectSolutions()));
  QuestionEntityState addNextPageIncorrectSolutions(int questionId,Iterable<int> solutionIds) =>
    QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageIncorrectSolutions(solutionIds)));

  
  QuestionEntityState getNextPageComments(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.startLoadingNextComments()));
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
}