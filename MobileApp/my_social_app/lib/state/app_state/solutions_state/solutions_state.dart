import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class SolutionsState {
  final Map<int, Pagination<int, SolutionState>> questionSolutions;
  final Map<int, Pagination<int, SolutionState>> questionCorrectSolutions;
  final Map<int, Pagination<int, SolutionState>> questionPendingSolutions;
  final Map<int, Pagination<int, SolutionState>> questionIncorrectSolutions;
  final Map<int, Pagination<int, SolutionState>> questionVideoSolutions;

  const SolutionsState({
    required this.questionSolutions,
    required this.questionCorrectSolutions,
    required this.questionPendingSolutions,
    required this.questionIncorrectSolutions,
    required this.questionVideoSolutions,
  });

  SolutionsState _optional({
    Map<int, Pagination<int,SolutionState>>? newQuestionSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionCorrectSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionPendingSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionIncorrectSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionVideoSolutions,
  }) => 
    SolutionsState(
      questionSolutions: newQuestionSolutions ?? questionSolutions,
      questionCorrectSolutions: newQuestionCorrectSolutions ?? questionCorrectSolutions,
      questionPendingSolutions: newQuestionPendingSolutions ?? questionPendingSolutions,
      questionIncorrectSolutions: newQuestionIncorrectSolutions ?? questionIncorrectSolutions,
      questionVideoSolutions: newQuestionVideoSolutions ?? questionVideoSolutions,
    );

  //solutions
  SolutionsState create(SolutionState solution) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        solution.questionId,
        selectQuestionSolutionsFromState(this, solution.questionId).prependOne(solution)
      ),
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        solution.questionId,
        selectQuestionPendingSolutionsFromState(this, solution.questionId).prependOne(solution)
      ),
      newQuestionVideoSolutions: solution.hasVideo
        ? questionVideoSolutions.updateElsePrependOne(
            solution.questionId,
            selectQuestionVideoSolutionsFromState(this, solution.questionId).prependOne(solution)
          )
        : questionVideoSolutions
    );
  SolutionsState delete(SolutionState solution) =>
    _optional(
      
      newQuestionSolutions: questionSolutions[solution.questionId] != null 
        ? questionSolutions.updateOne(
            solution.questionId,
            questionSolutions[solution.questionId]!.removeOne(solution.id)
          )
        : questionSolutions,

      newQuestionCorrectSolutions: questionCorrectSolutions[solution.questionId] != null && 
      solution.state == SolutionStatus.correct
        ? questionCorrectSolutions.updateOne(
            solution.questionId,
            questionCorrectSolutions[solution.questionId]!.removeOne(solution.id)
          )
        : questionCorrectSolutions,

      newQuestionPendingSolutions: questionPendingSolutions[solution.questionId] != null &&
      solution.state == SolutionStatus.pending
        ? questionPendingSolutions.updateOne(
            solution.questionId,
            questionPendingSolutions[solution.questionId]!.removeOne(solution.id)
          )
        : questionPendingSolutions,

      newQuestionIncorrectSolutions: questionIncorrectSolutions[solution.questionId] != null &&
      solution.state == SolutionStatus.incorrect
        ? questionIncorrectSolutions.updateOne(
            solution.questionId,
            questionIncorrectSolutions[solution.questionId]!.removeOne(solution.questionId)
          )
        : questionIncorrectSolutions,

      newQuestionVideoSolutions: questionVideoSolutions[solution.questionId] != null &&
      solution.hasVideo
        ? questionVideoSolutions.updateOne(
            solution.questionId,
            questionVideoSolutions[solution.questionId]!.removeOne(solution.questionId)
          )
        : questionVideoSolutions,
      // newSavedSolutions: savedSolutions.removeOne(solution.questionId)
    );
  SolutionsState markAsCorrect(SolutionState solution) =>
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        questionSolutions[solution.questionId]?.updateOne(solution.markAsCorrect())
      ),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        solution.questionId,
        questionCorrectSolutions[solution.questionId]?.addInOrder(solution.markAsCorrect())
      ),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        solution.questionId,
        questionPendingSolutions[solution.questionId]?.removeOne(solution.id)
      ),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        solution.questionId,
        questionVideoSolutions[solution.questionId]?.updateOne(solution.markAsCorrect())
      )
    );
  SolutionsState markAsIncorrect(SolutionState solution) =>
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        questionSolutions[solution.questionId]?.updateOne(solution.markAsIncorrect())
      ),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        solution.questionId,
        questionPendingSolutions[solution.questionId]?.removeOne(solution.id)
      ),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        solution.questionId,
        questionIncorrectSolutions[solution.questionId]?.addInOrder(solution.markAsIncorrect())
      ),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        solution.questionId,
        questionVideoSolutions[solution.questionId]?.updateOne(solution.markAsIncorrect())
      )
    );
  //solutions

  // question solutions;
  SolutionsState startLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState refreshQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).refreshPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  // question solutions;

  // question correct solutions
  SolutionsState startLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState refreshQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).refreshPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  // question correct solutions

  // question pending solutions
  SolutionsState startLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        questionId,
        selectQuestionPendingSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState refreshQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsFromState(this, questionId).refreshPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        questionId,
        selectQuestionPendingSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  // question pending solutions

  // question incorrect solutions
  SolutionsState startLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState refreshQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).refreshPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  // question incorrect solutions

  // question video solutions
  SolutionsState startLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState refreshQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).refreshPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  // question video solutions
}