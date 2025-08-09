import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_status.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';

@immutable
class SolutionsState {
  final EntityCollection<int, SolutionState> solutions;
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
    EntityCollection<int, SolutionState>? newSolutions,
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

  //solutions
  SolutionsState loading(int solutionId) =>
    _optional(
      newSolutions: solutions.loading(solutionId)
    );
  SolutionsState success(SolutionState solution) =>
    _optional(
      newSolutions: solutions.success(solution.id, solution)
    );
  SolutionsState failed(int solutionId) =>
    _optional(
      newSolutions: solutions.failed(solutionId)
    );
  SolutionsState notFound(int solutionId) =>
    _optional(
      newSolutions: solutions.notFound(solutionId)
    );

  SolutionsState create(SolutionState solution) => 
    _optional(
      newSolutions: solutions.successOne(solution.id, solution),
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        selectQuestionSolutionsPaginationFromState(this, solution.questionId).addOne(solution.id)
      ),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        solution.questionId,
        selectQuestionPendingSolutionsPaginationFromState(this, solution.questionId).addOne(solution.id)
      ),
      newQuestionVideoSolutions: solution.hasVideo
        ? questionVideoSolutions.setOne(
            solution.questionId,
            selectQuestionVideoSolutionsPaginationFromState(this, solution.questionId).addOne(solution.id)
          )
        : questionVideoSolutions
    );
  SolutionsState delete(SolutionState solution) =>
    _optional(
      newSolutions: solutions.removeOne(solution.id),
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        questionSolutions[solution.questionId]?.removeOne(solution.id)
      ),
      newQuestionCorrectSolutions: 
        solution.state == SolutionStatus.correct
          ? questionCorrectSolutions.setOne(
              solution.questionId,
              questionCorrectSolutions[solution.questionId]?.removeOne(solution.id)
            )
          : questionCorrectSolutions,
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
              questionIncorrectSolutions[solution.questionId]?.removeOne(solution.questionId)
            )
          : questionIncorrectSolutions,
      newQuestionVideoSolutions:
        solution.hasVideo
          ? questionVideoSolutions.setOne(
              solution.questionId,
              questionVideoSolutions[solution.questionId]?.removeOne(solution.questionId)
            )
        : questionVideoSolutions,
    );
  SolutionsState makeUpvote(SolutionState solution) =>
    _optional(newSolutions: solutions.updateOne(solution.id, solution.makeUpvote()));
  SolutionsState removeUpvote(SolutionState solution) =>
    _optional(newSolutions: solutions.updateOne(solution.id, solution.removeUpvote()));

  SolutionsState makeDownvote(SolutionState solution) =>
    _optional(newSolutions: solutions.updateOne(solution.id, solution.makeDownvote()));
  SolutionsState removeDownvote(SolutionState solution) =>
    _optional(newSolutions: solutions.updateOne(solution.id, solution.removeDownvote()));

  SolutionsState markAsCorrect(SolutionState solution) =>
    _optional(
      newSolutions: solutions.updateOne(solution.id, solution.markAsCorrect()),
    );
  SolutionsState markAsIncorrect(SolutionState solution) =>
    _optional(
      newSolutions: solutions.updateOne(solution.id, solution.markAsIncorrect()),
    );
  //solutions

  // question solutions;
  SolutionsState startLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsPaginationFromState(this, questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsPaginationFromState(this, questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsPaginationFromState(this, questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        selectQuestionSolutionsPaginationFromState(this, questionId).stopNext()
      )
    );
  // question solutions;

  // question correct solutions
  SolutionsState startLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsPaginationFromState(this, questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsPaginationFromState(this, questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsPaginationFromState(this, questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        selectQuestionCorrectSolutionsPaginationFromState(this, questionId).stopNext()
      )
    );
  // question correct solutions

  // question pending solutions
  SolutionsState startLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsPaginationFromState(this, questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsPaginationFromState(this, questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsPaginationFromState(this, questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        selectQuestionPendingSolutionsPaginationFromState(this, questionId).stopNext()
      )
    );
  // question pending solutions

  // question incorrect solutions
  SolutionsState startLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsPaginationFromState(this, questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsPaginationFromState(this, questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsPaginationFromState(this, questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        selectQuestionIncorrectSolutionsPaginationFromState(this, questionId).stopNext()
      )
    );
  // question incorrect solutions

  // question video solutions
  SolutionsState startLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsPaginationFromState(this, questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsPaginationFromState(this, questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.successMany({for (var e in solutions) e.id: e }),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsPaginationFromState(this, questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        selectQuestionVideoSolutionsPaginationFromState(this, questionId).stopNext()
      )
    );
  // question video solutions
}