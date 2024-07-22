import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class CreateSolutionAction extends redux.Action{
  const CreateSolutionAction();
}

@immutable
class ChangeQuestionIdAction extends redux.Action{
  final int questionId;
  const ChangeQuestionIdAction({required this.questionId});
}

@immutable
class ChangeSolutionContentAction extends redux.Action{
  final String content;
  const ChangeSolutionContentAction({required this.content});
}

@immutable
class AddSolutionImageAction extends redux.Action{
  final XFile image;
  const AddSolutionImageAction({required this.image});
}

@immutable
class RemoveSolutoionImageAction extends redux.Action{
  final XFile image;
  const RemoveSolutoionImageAction({required this.image});
}

@immutable
class ClearCreateSolutionStateAction extends redux.Action{
  const ClearCreateSolutionStateAction();
}