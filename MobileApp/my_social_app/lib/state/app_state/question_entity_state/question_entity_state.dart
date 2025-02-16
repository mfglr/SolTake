import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

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
  QuestionEntityState addNextPageLikes(int questionId,Iterable<QuestionUserLikeState> questionUserLikes)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNextPageLikes(questionUserLikes)));
  QuestionEntityState like(int questionId,QuestionUserLikeState questionUserLike)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.like(questionUserLike)));
  QuestionEntityState dislike(int questionId,int userId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.dislike(userId)));
  QuestionEntityState addNewLike(int questionId,QuestionUserLikeState questionUserLike)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.addNewLike(questionUserLike)));

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

  QuestionEntityState markAsSolved(int questionid)
    => QuestionEntityState(entities: entities[questionid] != null ? updateOne(entities[questionid]!.markAsSolved()) : entities);

  QuestionEntityState save(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.save()));
  QuestionEntityState unsave(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]?.unsave()));
}