import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
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
  // final Pagination<int, SolutionUserSaveState> savedSolutions;

  const SolutionsState({
    required this.questionSolutions,
    required this.questionCorrectSolutions,
    required this.questionPendingSolutions,
    required this.questionIncorrectSolutions,
    required this.questionVideoSolutions,
    // required this.savedSolutions
  });

  SolutionsState _optional({
    Map<int, Pagination<int,SolutionState>>? newQuestionSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionCorrectSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionPendingSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionIncorrectSolutions,
    Map<int, Pagination<int,SolutionState>>? newQuestionVideoSolutions,
    // Pagination<int, SolutionUserSaveState>? newSavedSolutions,
  }) => 
    SolutionsState(
      questionSolutions: newQuestionSolutions ?? questionSolutions,
      questionCorrectSolutions: newQuestionCorrectSolutions ?? questionCorrectSolutions,
      questionPendingSolutions: newQuestionPendingSolutions ?? questionPendingSolutions,
      questionIncorrectSolutions: newQuestionIncorrectSolutions ?? questionIncorrectSolutions,
      questionVideoSolutions: newQuestionVideoSolutions ?? questionVideoSolutions,
      // savedSolutions: newSavedSolutions ?? savedSolutions
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
  
  // SolutionsState startLoadingNextSavedSolutions() => 
  //   _optional(newSavedSolutions: savedSolutions.startLoadingNext());
  // SolutionsState addNextPageSavedSolutions(Iterable<SolutionUserSaveState> solutions) => 
  //   _optional(newSavedSolutions: savedSolutions.addNextPage(solutions));
  // SolutionsState stopLoadingNextSavedSolutions() => 
  //   _optional(newSavedSolutions: savedSolutions.stopLoadingNext());

  // SolutionsState save(int id, SolutionState solution) =>
  //   _optional(
      
  //     newQuestionSolutions: 
  //       questionSolutions[solution.questionId] != null
  //         ? questionSolutions.updateOne(
  //             solution.questionId,
  //             selectQuestionSolutionsFromState(this, solution.questionId)
  //               .updateOne(solution.save())
  //           )
  //         : questionSolutions,

  //     newQuestionCorrectSolutions: 
  //       solution.state == SolutionStatus.correct && questionCorrectSolutions[solution.questionId] != null
  //         ? questionCorrectSolutions.updateOne(
  //             solution.questionId,
  //             selectQuestionCorrectSolutionsFromState(this, solution.questionId)
  //               .updateOne(solution.save())
  //           )
  //         : questionCorrectSolutions,

  //     newQuestionPendingSolutions: 
  //       solution.state == SolutionStatus.pending && questionPendingSolutions[solution.questionId] != null
  //         ? questionPendingSolutions.updateOne(
  //             solution.questionId,
  //             selectQuestionPendingSolutionsFromState(this, solution.questionId)
  //               .updateOne(solution.save())
  //           )
  //         : questionPendingSolutions,

  //     newQuestionIncorrectSolutions:
  //       solution.state == SolutionStatus.incorrect && questionIncorrectSolutions[solution.questionId] != null
  //         ? questionIncorrectSolutions.updateOne(
  //             solution.questionId,
  //             selectQuestionIncorrectSolutionsFromState(this, solution.questionId)
  //               .updateOne(solution.save())
  //           )
  //         : questionIncorrectSolutions,

  //     newQuestionVideoSolutions: solution.hasVideo && questionVideoSolutions[solution.questionId] != null
  //         ? questionVideoSolutions.updateOne(
  //             solution.questionId,
  //             selectQuestionVideoSolutionsFromState(this, solution.questionId)
  //               .updateOne(solution.save())
  //           )
  //         : questionVideoSolutions,

  //     newSavedSolutions: savedSolutions.prependOne(SolutionUserSaveState(
  //       id: id,
  //       solution: solution.save()
  //     ))
      
  //   );
  // SolutionsState unsave(int solutionId) =>
  //   _optional(newSavedSolutions: savedSolutions.where((e) => e.solution.id != solutionId));
}