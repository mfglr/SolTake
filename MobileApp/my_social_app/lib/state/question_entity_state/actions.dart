import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class CreateQuestionAction extends redux.Action{
  const CreateQuestionAction();
}

@immutable
class CreateQuestionSucessAction extends redux.Action{
  final QuestionState payload;
  const CreateQuestionSucessAction({required this.payload});
}

@immutable
class LoadQuestionsByUserIdAction extends redux.Action{
  final int userId;
  const LoadQuestionsByUserIdAction({required this.userId});
}

@immutable
class LoadQuestionsByUserIdSuccessAction extends redux.Action{
  final List<QuestionState> payload;
  const LoadQuestionsByUserIdSuccessAction({
    required this.payload,
  });
}

@immutable
class LoadQuestionImageAction extends redux.Action{
  final int questionId;
  final int index;
  const LoadQuestionImageAction({required this.questionId, required this.index});
}

@immutable
class LoadQuestionImageSuccessAction extends redux.Action{
  final questionId;
  final int index;
  final Uint8List image;
  const LoadQuestionImageSuccessAction({required this.questionId, required this.index,required this.image});
}