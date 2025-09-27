import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';

class QuestionContentWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionContentWidget({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        question.content!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}