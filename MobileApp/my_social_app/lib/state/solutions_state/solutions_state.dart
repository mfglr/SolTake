import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/solution_status.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';

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
    _optional(newSolutions: solutions.create(solutionId));
  SolutionsState success(SolutionState solution) =>
    _optional(newSolutions: solutions.loadSuccess(solution.id, solution));
  SolutionsState failed(int solutionId) =>
    _optional(newSolutions: solutions.loadFailed(solutionId));
  SolutionsState notFound(int solutionId) =>
    _optional(newSolutions: solutions.notFound(solutionId));

  SolutionsState upload(SolutionState solution) => 
    _optional(
      newSolutions: solutions.upload(solution.id, solution),
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        _selectQuestionSolutionsKeyPagination(solution.questionId).addOne(solution.id)
      ),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        solution.questionId,
        _selectQuestionPendingSolutionsKeyPagination(solution.questionId).addOne(solution.id)
      ),
      newQuestionVideoSolutions: solution.hasVideo
        ? questionVideoSolutions.setOne(
            solution.questionId,
            _selectQuestionVideoSolutionsKeyPagination(solution.questionId).addOne(solution.id)
          )
        : questionVideoSolutions
    );
  SolutionsState changeRate(SolutionState solution, double rate) =>
    _optional(newSolutions: solutions.changeRate(solution.id, rate));
  SolutionsState processing(SolutionState solution) =>
    _optional(newSolutions: solutions.processing(solution.id));
  SolutionsState uploadSuccess(SolutionState solution, int serverId) =>
    _optional(
      newSolutions: solutions.loadSuccess(serverId, solution.changeId(serverId)).remove(solution.id),
      newQuestionSolutions: questionSolutions.setOne(
        solution.questionId,
        _selectQuestionSolutionsKeyPagination(solution.questionId)
          .addOne(serverId)
          .removeOne(solution.id)
      ),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        solution.questionId,
        _selectQuestionPendingSolutionsKeyPagination(solution.questionId)
          .addOne(serverId)
          .removeOne(solution.id)
      ),
      newQuestionVideoSolutions: solution.hasVideo
        ? questionVideoSolutions.setOne(
            solution.questionId,
            _selectQuestionVideoSolutionsKeyPagination(solution.questionId)
              .addOne(serverId)
              .removeOne(solution.id)
          )
        : questionVideoSolutions
    );
  SolutionsState uploadFailed(SolutionState solution) =>
    _optional(newSolutions: solutions.uploadFailed(solution.id));

  SolutionsState delete(SolutionState solution) =>
    _optional(
      newSolutions: solutions.delete(solution.id),
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
    _optional(newSolutions: solutions.update(solution.id, solution.makeUpvote()));
  SolutionsState removeUpvote(SolutionState solution) =>
    _optional(newSolutions: solutions.update(solution.id, solution.removeUpvote()));

  SolutionsState makeDownvote(SolutionState solution) =>
    _optional(newSolutions: solutions.update(solution.id, solution.makeDownvote()));
  SolutionsState removeDownvote(SolutionState solution) =>
    _optional(newSolutions: solutions.update(solution.id, solution.removeDownvote()));

  SolutionsState markAsCorrect(SolutionState solution) =>
    _optional(newSolutions: solutions.update(solution.id, solution.markAsCorrect()));
  SolutionsState markAsIncorrect(SolutionState solution) =>
    _optional(newSolutions: solutions.update(solution.id, solution.markAsIncorrect()));
  //solutions

  // question solutions;
  KeyPagination<int> _selectQuestionSolutionsKeyPagination(int questionId) =>
    questionSolutions[questionId] ?? KeyPagination.init(questionsPerPage, true);
  SolutionsState startLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        _selectQuestionSolutionsKeyPagination(questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        _selectQuestionSolutionsKeyPagination(questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        _selectQuestionSolutionsKeyPagination(questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionSolutions(int questionId) => 
    _optional(
      newQuestionSolutions: questionSolutions.setOne(
        questionId,
        _selectQuestionSolutionsKeyPagination(questionId).stopNext()
      )
    );
  ContainerPagination<int,SolutionState> selectQuestionSolutions(int questionId) =>
    ContainerPagination.fromCollection(solutions, _selectQuestionSolutionsKeyPagination(questionId));
  // question solutions;

  // question correct solutions
  KeyPagination<int> _selectQuestionCorrectSolutionsKeyPagination(int questionId) =>
    questionCorrectSolutions[questionId] ?? KeyPagination.init(questionsPerPage, true);
  SolutionsState startLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        _selectQuestionCorrectSolutionsKeyPagination(questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        _selectQuestionCorrectSolutionsKeyPagination(questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionCorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        _selectQuestionCorrectSolutionsKeyPagination(questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionCorrectSolutions(int questionId) => 
    _optional(
      newQuestionCorrectSolutions: questionCorrectSolutions.setOne(
        questionId,
        _selectQuestionCorrectSolutionsKeyPagination(questionId).stopNext()
      )
    );
  ContainerPagination<int,SolutionState> selectQuestionCorrectSolutions(int questionId) =>
    ContainerPagination.fromCollection(solutions, _selectQuestionCorrectSolutionsKeyPagination(questionId));
  // question correct solutions

  // question pending solutions
  KeyPagination<int> _selectQuestionPendingSolutionsKeyPagination(int questionId) =>
    questionPendingSolutions[questionId] ?? KeyPagination.init(questionsPerPage, true);
  SolutionsState startLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        _selectQuestionPendingSolutionsKeyPagination(questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        _selectQuestionPendingSolutionsKeyPagination(questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionPendingSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        _selectQuestionPendingSolutionsKeyPagination(questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionPendingSolutions(int questionId) => 
    _optional(
      newQuestionPendingSolutions: questionPendingSolutions.setOne(
        questionId,
        _selectQuestionPendingSolutionsKeyPagination(questionId).stopNext()
      )
    );
  ContainerPagination<int,SolutionState> selectQuestionPendingSolutions(int questionId) =>
    ContainerPagination.fromCollection(solutions, _selectQuestionPendingSolutionsKeyPagination(questionId));
  // question pending solutions

  // question incorrect solutions
  KeyPagination<int> _selectQuestionIncorrectSolutionsKeyPagination(int questionId) =>
    questionIncorrectSolutions[questionId] ?? KeyPagination.init(questionsPerPage, true);
  SolutionsState startLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        _selectQuestionIncorrectSolutionsKeyPagination(questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        _selectQuestionIncorrectSolutionsKeyPagination(questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionIncorrectSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        _selectQuestionIncorrectSolutionsKeyPagination(questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionIncorrectSolutions(int questionId) => 
    _optional(
      newQuestionIncorrectSolutions: questionIncorrectSolutions.setOne(
        questionId,
        _selectQuestionIncorrectSolutionsKeyPagination(questionId).stopNext()
      )
    );
  ContainerPagination<int,SolutionState> selectQuestionIncorrectSolutions(int questionId) =>
    ContainerPagination.fromCollection(solutions, _selectQuestionIncorrectSolutionsKeyPagination(questionId));
  // question incorrect solutions

  // question video solutions
  KeyPagination<int> _selectQuestionVideoSolutionsKeyPagination(int questionId) =>
    questionVideoSolutions[questionId] ?? KeyPagination.init(questionsPerPage, true);
  SolutionsState startLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        _selectQuestionVideoSolutionsKeyPagination(questionId).startNext()
      )
    );
  SolutionsState addNextPageQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        _selectQuestionVideoSolutionsKeyPagination(questionId).addNext(solutions.map((e) => e.id))
      )
    );
  SolutionsState refreshQuestionVideoSolutions(int questionId, Iterable<SolutionState> solutions) => 
    _optional(
      newSolutions: this.solutions.loadSuccessMany({for (var e in solutions) e.id: e }),
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        _selectQuestionVideoSolutionsKeyPagination(questionId).refresh(solutions.map((e) => e.id))
      )
    );
  SolutionsState stopLoadingNextQuestionVideoSolutions(int questionId) => 
    _optional(
      newQuestionVideoSolutions: questionVideoSolutions.setOne(
        questionId,
        _selectQuestionVideoSolutionsKeyPagination(questionId).stopNext()
      )
    );
  ContainerPagination<int,SolutionState> selectQuestionVideoSolutions(int questionId) =>
    ContainerPagination.fromCollection(solutions, _selectQuestionVideoSolutionsKeyPagination(questionId));
  // question video solutions
}