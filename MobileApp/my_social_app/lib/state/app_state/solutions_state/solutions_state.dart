import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class SolutionsState {
  final Map<int, Pagination<int,SolutionState>> questionSolutions;
  final Map<int, Pagination<int,SolutionState>> questionCorrectSolutions;
  final Map<int, Pagination<int,SolutionState>> questionPendingSolutions;
  final Map<int, Pagination<int,SolutionState>> questionIncorrectSolutions;
  final Map<int, Pagination<int, SolutionState>> questionVideoSolutions;

  const SolutionsState({
    required this.questionSolutions,
    required this.questionCorrectSolutions,
    required this.questionPendingSolutions,
    required this.questionIncorrectSolutions,
    required this.questionVideoSolutions
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
      questionVideoSolutions: newQuestionVideoSolutions ?? questionVideoSolutions 
    );

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

  SolutionsState startLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.updateElsePrependOne(
        questionId,
        selectQuestionSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );

  SolutionsState startLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionCorrectSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );

  SolutionsState startLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
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
  SolutionsState stopLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.updateElsePrependOne(
        questionId,
        selectQuestionPendingSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );

  SolutionsState startLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.updateElsePrependOne(
        questionId,
        selectQuestionIncorrectSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
  
  SolutionsState startLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).startLoadingNext()
      )
    );
  SolutionsState addNextPageQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).addNextPage(solutions)
      )
    );
  SolutionsState stopLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.updateElsePrependOne(
        questionId,
        selectQuestionVideoSolutionsFromState(this, questionId).stopLoadingNext()
      )
    );
}