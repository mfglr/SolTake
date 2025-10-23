import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/solution_user_save_state.dart';

//solutions

@immutable
class LoadSolutionAction extends AppAction{
  final int solutionId;
  const LoadSolutionAction({required this.solutionId});
}
@immutable
class LoadSolutionSuccessAction extends AppAction{
  final SolutionState solution;
  const LoadSolutionSuccessAction({required this.solution});
}
@immutable
class LoadSolutionFailedAction extends AppAction{
  final int solutionId;
  const LoadSolutionFailedAction({required this.solutionId});
}
@immutable
class SolutionNotFoundAction extends AppAction{
  final int solutionId;
  const SolutionNotFoundAction({required this.solutionId});
}

@immutable
class UploadSolutionAction extends AppAction{
  final SolutionState solution;
  const UploadSolutionAction({required this.solution});
}
@immutable
class CreateSolutionByAIAction extends AppAction{
  final SolutionState solution;
  const CreateSolutionByAIAction({
    required this.solution
  });
}
@immutable
class ChangeSolutionRateAction extends AppAction{
  final double rate;
  final SolutionState solution;
  const ChangeSolutionRateAction({
    required this.rate,
    required this.solution
  });
}
@immutable
class MarkSolutionAsProcessingAction extends AppAction{
  final SolutionState solution;
  const MarkSolutionAsProcessingAction({required this.solution});
}
@immutable
class UploadSolutionSuccessAction extends AppAction{
  final SolutionState solution;
  final int serverId;
  const UploadSolutionSuccessAction({
    required this.solution,
    required this.serverId
  });
}
@immutable
class UploadSolutionFailedAction extends AppAction{
  final SolutionState solution;
  const UploadSolutionFailedAction({required this.solution});
}



@immutable
class DeleteSolutionAction extends AppAction{
  final SolutionState solution;
  const DeleteSolutionAction({
    required this.solution
  });
}
@immutable
class DeleteSolutionSuccessAction extends AppAction{
  final SolutionState solution;
  const DeleteSolutionSuccessAction({
    required this.solution,
  });
}
@immutable
class MarkSolutionAsCorrectAction extends AppAction{
  final SolutionState solution;

  const MarkSolutionAsCorrectAction({
    required this.solution
  });
}
@immutable
class MarkSolutionAsCorrectSuccessAction extends AppAction{
  final SolutionState solution;

  const MarkSolutionAsCorrectSuccessAction({
    required this.solution
  });
}
@immutable
class MarkSolutionAsIncorrectAction extends AppAction{
  final SolutionState solution;

  const MarkSolutionAsIncorrectAction({
    required this.solution
  });
}
@immutable
class MarkSolutionAsIncorrectSuccessAction extends AppAction{
  final SolutionState solution;

  const MarkSolutionAsIncorrectSuccessAction({
    required this.solution
  });
}
//solutions

//question solutions
@immutable
class NextQuestionSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const NextQuestionSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class NextQuestionSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionSolutionsFailedAction({required this.questionId});
}
@immutable
class RefreshQuestionSolutionsAction extends AppAction{
  final int questionId;
  const RefreshQuestionSolutionsAction({required this.questionId});
}
@immutable
class RefreshQuestionSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const RefreshQuestionSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class RefreshQuestionSolutionsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionSolutionsFailedAction({required this.questionId});
}
//question solutions

//question correct solutions
@immutable
class NextQuestionCorrectSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionCorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const NextQuestionCorrectSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class NextQuestionCorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionCorrectSolutionsFailedAction({required this.questionId});
}
@immutable
class RefreshQuestionCorrectSolutionsAction extends AppAction{
  final int questionId;
  const RefreshQuestionCorrectSolutionsAction({required this.questionId});
}
@immutable
class RefreshQuestionCorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const RefreshQuestionCorrectSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class RefreshQuestionCorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionCorrectSolutionsFailedAction({required this.questionId});
}
//question correct solutions

//question pending solutions
@immutable
class NextQuestionPendingSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionPendingSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const NextQuestionPendingSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class NextQuestionPendingSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionPendingSolutionsFailedAction({required this.questionId});
}
@immutable
class RefreshQuestionPendingSolutionsAction extends AppAction{
  final int questionId;
  const RefreshQuestionPendingSolutionsAction({required this.questionId});
}
@immutable
class RefreshQuestionPendingSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const RefreshQuestionPendingSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class RefreshQuestionPendingSolutionsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionPendingSolutionsFailedAction({required this.questionId});
}
//question pending solutions

//question incorrect solutions
@immutable
class NextQuestionIncorrectSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionIncorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const NextQuestionIncorrectSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class NextQuestionIncorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionIncorrectSolutionsFailedAction({required this.questionId});
}
@immutable
class RefreshQuestionIncorrectSolutionsAction extends AppAction{
  final int questionId;
  const RefreshQuestionIncorrectSolutionsAction({required this.questionId});
}
@immutable
class RefreshQuestionIncorrectSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const RefreshQuestionIncorrectSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class RefreshQuestionIncorrectSolutionsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionIncorrectSolutionsFailedAction({required this.questionId});
}
//question incorrect solutions

//question video solutions
@immutable
class NextQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionVideoSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const NextQuestionVideoSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class NextQuestionVideoSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsFailedAction({required this.questionId});
}
@immutable
class RefreshQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  const RefreshQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class RefreshQuestionVideoSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<SolutionState> solutions;
  const RefreshQuestionVideoSolutionsSuccessAction({required this.questionId, required this.solutions});
}
@immutable
class RefreshQuestionVideoSolutionsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionVideoSolutionsFailedAction({required this.questionId});
}
//question video solutions

//saved solutions
@immutable
class NextSavedSolutionsAction extends AppAction{
  const NextSavedSolutionsAction();
}
@immutable
class NextSavedSolutionsSuccessAction extends AppAction{
  final Iterable<SolutionUserSaveState> solutions;
  const NextSavedSolutionsSuccessAction({required this.solutions});
}
@immutable
class NextSavedSolutionsFailedAction extends AppAction{
  const NextSavedSolutionsFailedAction();
}
@immutable
class RefreshSavedSolutionsAction extends AppAction{
  const RefreshSavedSolutionsAction();
}
@immutable
class RefreshSavedSolutionsSuccessAction extends AppAction{
  final Iterable<SolutionUserSaveState> solutions;
  const RefreshSavedSolutionsSuccessAction({required this.solutions});
}
@immutable
class RefreshSavedSolutionsFailedAction extends AppAction{
  const RefreshSavedSolutionsFailedAction();
}

@immutable
class SaveSolutionAction extends AppAction{
  final SolutionState solution;
  const SaveSolutionAction({required this.solution});
}
@immutable
class SaveSolutionSuccessAction extends AppAction{
  final int id;
  final SolutionState solution;
  const SaveSolutionSuccessAction({required this.id, required this.solution});
}

@immutable
class UnsaveSolutionAction extends AppAction{
  final SolutionState solution;
  const UnsaveSolutionAction({required this.solution});
}
@immutable
class UnsaveSolutionSuccessAction extends AppAction{
  final int solutionId;
  const UnsaveSolutionSuccessAction({required this.solutionId});
}
//saved solution