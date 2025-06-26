import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_item/widgets/question_publishing_state/question_publishing_state_widget_constants.dart';

class QuestionPublishingStateWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionPublishingStateWidget({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      options[question.publishingState][getLanguage(context)]!,
      style: TextStyle(
        color: colors[question.publishingState]
      ),
    );
  }
}