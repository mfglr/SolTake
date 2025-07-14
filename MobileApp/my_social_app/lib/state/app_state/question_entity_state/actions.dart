import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

@immutable
class CreateQuestionAction extends AppAction{
  final String id;
  final int examId;
  final int subjectId;
  final int? topicId;
  final String content;
  final Iterable<AppFile> medias;

  const CreateQuestionAction({
    required this.id,
    required this.examId,
    required this.subjectId,
    required this.topicId,
    required this.content,
    required this.medias
  });
}
@immutable
class DeleteQuestionAction extends AppAction{
  final int questionId;
  const DeleteQuestionAction({required this.questionId});
}
@immutable
class DeleteQuestionSuccessAction extends AppAction{
  final int questionId;
  const DeleteQuestionSuccessAction({required this.questionId});
}

@immutable
class LoadQuestionAction extends AppAction{
  final int questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class AddQuestionAction extends AppAction{
  final QuestionState value;
  const AddQuestionAction({required this.value});
}
@immutable
class AddQuestionsAction extends AppAction{
  final Iterable<QuestionState> questions;
  const AddQuestionsAction({required this.questions});
}

@immutable
class MarkQuestionSolutionAsCorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsCorrectAction({required this.questionId,required this.solutionId});
}
@immutable
class MarkQuestionSolutionAsIncorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsIncorrectAction({required this.questionId,required this.solutionId});
}

@immutable
class NextQuestionVideoSolutionsAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsAction({required this.questionId});
}
@immutable
class NextQuestionVideoSolutionsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<int> solutionIds;
  const NextQuestionVideoSolutionsSuccessAction({required this.questionId, required this.solutionIds});
}
@immutable
class NextQuestionVideoSolutionsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionVideoSolutionsFailedAction({required this.questionId});
}
@immutable
class AddQuestionVideoSolutionAction extends AppAction{
  final int questionId;
  final int solutionId;
  const AddQuestionVideoSolutionAction({required this.questionId, required this.solutionId});
}

@immutable
class SaveQuestionAction extends AppAction{
  final int questionId;
  const SaveQuestionAction({required this.questionId});
}

@immutable
class UnsaveQuestionAction extends AppAction{
  final int questionId;
  const UnsaveQuestionAction({required this.questionId});
}
