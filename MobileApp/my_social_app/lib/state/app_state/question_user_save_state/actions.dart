import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_state.dart';

@immutable
class AddQuestionUserSavesAction extends AppAction{
  final Iterable<QuestionUserSaveState> saves;
  const AddQuestionUserSavesAction({required this.saves});
}
@immutable
class AddQuestionUserSaveAction extends AppAction{
  final QuestionUserSaveState save;
  const AddQuestionUserSaveAction({required this.save});
}
@immutable
class RemoveQuestionUserSaveAction extends AppAction{
  final int saveId;
  const RemoveQuestionUserSaveAction({required this.saveId});
}