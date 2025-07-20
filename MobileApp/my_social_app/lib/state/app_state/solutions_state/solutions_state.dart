import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';

@immutable
class SolutionsState {
  final EntityState<int, SolutionState> solutions;
  final Map<int, KeyPagination<int>> questionSolutions;
  final Map<int, KeyPagination<int>> questionCorrectSolutions;
  final Map<int, KeyPagination<int>> questionPendingSolutions;
  final Map<int, KeyPagination<int>> questionIncorrectSolutions;
  final Map<int, KeyPagination<int>> questionVideoSolutions;

  const SolutionsState({
    required this.solutions,
    required this.questionSolutions,
    required this.questionCorrectSolutions,
    required this.questionPendingSolutions,
    required this.questionIncorrectSolutions,
    required this.questionVideoSolutions,
  });

  SolutionsState _optional({
    EntityState<int,SolutionState>? newSolutions,
    Map<int, KeyPagination<int>>? newQuestionSolutions,
    Map<int, KeyPagination<int>>? newQuestionCorrectSolutions,
    Map<int, KeyPagination<int>>? newQuestionPendingSolutions,
    Map<int, KeyPagination<int>>? newQuestionIncorrectSolutions,
    Map<int, KeyPagination<int>>? newQuestionVideoSolutions,
  }) =>
    SolutionsState(
      solutions: newSolutions ?? solutions,
      questionSolutions: newQuestionSolutions ?? questionSolutions,
      questionCorrectSolutions: newQuestionCorrectSolutions ?? questionCorrectSolutions,
      questionPendingSolutions: newQuestionPendingSolutions ?? questionPendingSolutions,
      questionIncorrectSolutions: newQuestionIncorrectSolutions ?? questionIncorrectSolutions,
      questionVideoSolutions: newQuestionVideoSolutions ?? questionVideoSolutions,
    );

  SolutionsState create(SolutionState solution) => 
    _optional(
      newSolutions: solutions.setOne(solution),
      
      newQuestionSolutions:
        questionSolutions.setOne(
          solution.questionId,
          selectQuestionSolutionsKeyPaginationFromState(this,solution.questionId).prependOne(solution.id)
        ),
      
      newQuestionPendingSolutions: 
        questionPendingSolutions.setOne(
          solution.questionId,
          selectQuestionPendingSolutionsKeyPaginationFromState(this, solution.questionId).prependOne(solution.id)
        ),

      newQuestionVideoSolutions: solution.hasVideo
        ? questionVideoSolutions.setOne(
            solution.questionId,
            selectQuestionVideoSolutionsKeyPaginationFromState(this, solution.questionId).prependOne(solution.id)
          )
        : questionVideoSolutions
    );
  SolutionsState delete(SolutionState solution) =>
    _optional(
      newSolutions: solutions.removeOne(solution.id),

      newQuestionSolutions:
        questionSolutions.setOne(
          solution.questionId,
          questionSolutions[solution.questionId]?.removeOne(solution.id)
        ),

      newQuestionCorrectSolutions: 
        questionCorrectSolutions.setOne(
          solution.questionId,
          questionCorrectSolutions[solution.questionId]?.removeOne(solution.id)
        ),

      newQuestionPendingSolutions: 
        solution.state == SolutionStatus.pending
          ? questionPendingSolutions.setOne(
              solution.questionId,
              questionPendingSolutions[solution.questionId]?.removeOne(solution.id)
            )
          : questionPendingSolutions,

      newQuestionIncorrectSolutions:
        solution.state == SolutionStatus.incorrect
          ? questionIncorrectSolutions.setOne(
              solution.questionId,
              questionIncorrectSolutions[solution.questionId]?.removeOne(solution.id)
            )
          : questionIncorrectSolutions,

      newQuestionVideoSolutions:
        solution.hasVideo
          ? questionVideoSolutions.setOne(
              solution.questionId,
              questionVideoSolutions[solution.questionId]?.removeOne(solution.id)
            )
          : questionVideoSolutions,
    );
  SolutionsState markAsCorrect(SolutionState solution) =>
    _optional(
      newSolutions: solutions.setOne(solution.markAsCorrect()),
      
      newQuestionCorrectSolutions: 
        questionCorrectSolutions.setOne(
          solution.questionId,
          questionCorrectSolutions[solution.questionId]?.addOneInOrder(solution.id)
        ),

      newQuestionPendingSolutions:
        questionPendingSolutions.setOne(
          solution.questionId,
          questionPendingSolutions[solution.questionId]?.removeOne(solution.id)
        )
    );
  SolutionsState markAsIncorrect(SolutionState solution) =>
    _optional(
      newSolutions: solutions.setOne(solution.markAsIncorrect()),

      newQuestionIncorrectSolutions:
        questionIncorrectSolutions.setOne(
          solution.questionId,
          questionIncorrectSolutions[solution.questionId]?.addOneInOrder(solution.id)
        ),

      newQuestionPendingSolutions:
        questionPendingSolutions.setOne(
          solution.questionId,
          questionPendingSolutions[solution.questionId]?.removeOne(solution.id)
        ),
    );

  // question solutions
  SolutionsState startLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsKeyPaginationFromState(this, questionId).startLoadingNext()
      ),
    );
  SolutionsState addNextPageQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsKeyPaginationFromState(this, questionId).addNextPage(solutions.map((e) => e.id))
      ),
    );
  SolutionsState refreshQuestionSolutions(int questionId, Iterable<SolutionState> solutions) =>
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsKeyPaginationFromState(this, questionId).refreshPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionSolutions(int questionId) =>
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsKeyPaginationFromState(this, questionId).stopLoadingNext()
      ),
    );
  // question solutions

  // question correct solutions;
  SolutionsState startLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsKeyPaginationFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsKeyPaginationFromState(this, questionId).addNextPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) =>
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsKeyPaginationFromState(this, questionId).refreshPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsKeyPaginationFromState(this, questionId).stopLoadingNext()
      )
    );
  // question correct solutions;

  // question pending solutions;
  SolutionsState startLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsKeyPaginationFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        questionId,
        selectQuestionPendingSolutionsKeyPaginationFromState(this, questionId).addNextPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) =>
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsKeyPaginationFromState(this, questionId).refreshPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        questionId,
        selectQuestionPendingSolutionsKeyPaginationFromState(this, questionId).stopLoadingNext()
      )
    );
  // question pending solutions;

  // question incorrect solutions
  SolutionsState startLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsKeyPaginationFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsKeyPaginationFromState(this, questionId).addNextPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsKeyPaginationFromState(this, questionId).refreshPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsKeyPaginationFromState(this, questionId).stopLoadingNext()
      )
    );
  // question incorrect solutions
  
  // question video solutions
  SolutionsState startLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsKeyPaginationFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsKeyPaginationFromState(this, questionId).addNextPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.setMany(solutions),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsKeyPaginationFromState(this, questionId).refreshPage(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsKeyPaginationFromState(this, questionId).stopLoadingNext()
      )
    );
  // question video solutions
}