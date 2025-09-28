import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/questions_state/question_status.dart';

class QuestionStatusWidget extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  final double size;
  const QuestionStatusWidget({
    super.key,
    required this.container,
    this.size = 16
  });

  @override
  Widget build(BuildContext context) {
    final question = container.entity!;
    return Icon(
      question.state == QuestionStatus.solved
        ? Icons.check_circle
        : Icons.pending,
      color: question.state == QuestionStatus.solved
        ? Colors.green
        : Colors.yellow,
        size: size,
    );
  }
}