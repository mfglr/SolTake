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
class LoadQuestionsSuccessAction extends redux.Action{
  final Iterable<QuestionState> questions;
  const LoadQuestionsSuccessAction({required this.questions});
}

@immutable
class LoadQuestionImageAction extends redux.Action{
  final int questionId;
  final int index;
  const LoadQuestionImageAction({required this.questionId, required this.index});
}

@immutable
class LoadQuestionImageSuccessAction extends redux.Action{
  final int questionId;
  final int index;
  final Uint8List image;
  const LoadQuestionImageSuccessAction({required this.questionId, required this.index,required this.image});
}

@immutable
class LikeQuestionAction extends redux.Action{
  final int questionId;
  const LikeQuestionAction({required this.questionId});
}
@immutable
class LikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  const LikeQuestionSuccessAction({required this.questionId});
}

@immutable
class DislikeQuestionAction extends redux.Action{
  final int questionId;
  const DislikeQuestionAction({required this.questionId});
}
@immutable
class DislikeQuestionSuccessAction extends redux.Action{
  final int questionId;
  const DislikeQuestionSuccessAction({required this.questionId});
}

