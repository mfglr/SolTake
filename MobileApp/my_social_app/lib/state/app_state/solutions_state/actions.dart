import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class CreateSolutionAction extends AppAction{
  final String id;
  final QuestionState question;
  final String? content;
  final Iterable<AppFile> medias;
  
  const CreateSolutionAction({
    required this.id,
    required this.question,
    required this.content,
    required this.medias
  });
}
@immutable
class CreateSolutionSuccessAction extends AppAction{
  final SolutionState solution;
  const CreateSolutionSuccessAction({required this.solution});
}

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