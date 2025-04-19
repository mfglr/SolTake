import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';

@immutable
class QuestionUserSaveAction extends AppAction{
  const QuestionUserSaveAction();
}

@immutable
class CreateQuestionUserSaveAction extends QuestionUserSaveAction{
  final int questionId;
  const CreateQuestionUserSaveAction({required this.questionId});
}
@immutable
class CreateQuestionUserSaveSuccessAction extends QuestionUserSaveAction{
  final QuestionUserSaveState questionUserSave;
  const CreateQuestionUserSaveSuccessAction({required this.questionUserSave});
}

@immutable
class DeleteQuestionUserSaveAction extends QuestionUserSaveAction{
  final int questionId;
  const DeleteQuestionUserSaveAction({required this.questionId});
}
@immutable
class DeleteQuestionUserSaveSuccesAction extends QuestionUserSaveAction{
  final int questionId;
  const DeleteQuestionUserSaveSuccesAction({required this.questionId});
}

@immutable
class NextQuestionUserSavesAction extends QuestionUserSaveAction{
  const NextQuestionUserSavesAction();
}
@immutable
class NextQuestionUserSavesSuccessAction extends QuestionUserSaveAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const NextQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class NextQuestionUserSavesFailedAction extends QuestionUserSaveAction{
  const NextQuestionUserSavesFailedAction();
}

// @immutable
// class FirstQuestionUserSavesAction extends QuestionUserSaveAction{
//   const FirstQuestionUserSavesAction();
// }
// @immutable
// class FirstQuestionUserSavesSuccessAction extends QuestionUserSaveAction{
//   final Iterable<QuestionUserSaveState> questionUserSaves;

// }