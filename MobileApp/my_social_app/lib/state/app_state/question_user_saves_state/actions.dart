import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';

@immutable
class CreateQuestionUserSaveAction{
  final int questionId;
  const CreateQuestionUserSaveAction({required this.questionId});
}
@immutable
class CreateQuestionUserSaveSuccessAction{
  final QuestionUserSaveState questionUserSave;
  const CreateQuestionUserSaveSuccessAction({required this.questionUserSave});
}

@immutable
class DeleteQuestionUserSaveAction{
  final int questionId;
  const DeleteQuestionUserSaveAction({required this.questionId});
}
@immutable
class DeleteQuestionUserSaveSuccesAction{
  final int questionId;
  const DeleteQuestionUserSaveSuccesAction({required this.questionId});
}


@immutable
class NextQuestionUserSavesAction{
  const NextQuestionUserSavesAction();
}
@immutable
class NextQuestionUserSavesSuccessAction{
  final Iterable<QuestionUserSaveState> questionUserSaves;
  const NextQuestionUserSavesSuccessAction({required this.questionUserSaves});
}
@immutable
class NextQuestionUserSavesFailedAction{
  const NextQuestionUserSavesFailedAction();
}