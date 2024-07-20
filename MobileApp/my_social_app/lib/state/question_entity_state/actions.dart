import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class AddQuestionAction extends redux.Action{
  final QuestionState value;
  const AddQuestionAction({required this.value});
}
@immutable
class AddQuestionsAction extends redux.Action{
  final Iterable<QuestionState> questions;
  const AddQuestionsAction({required this.questions});
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

