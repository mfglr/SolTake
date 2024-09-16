import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/question_user_save_state/question_user_save_state.dart';

@immutable
class AddQuestionUserSavesAction extends redux.Action{
  final Iterable<QuestionUserSaveState> saves;
  const AddQuestionUserSavesAction({required this.saves});
}

@immutable
class AddQuestionUserSaveAction extends redux.Action{
  final QuestionUserSaveState save;
  const AddQuestionUserSaveAction({required this.save});
}

@immutable
class RemoveQuestionUserSaveAction extends redux.Action{
  final int saveId;
  const RemoveQuestionUserSaveAction({required this.saveId});
}