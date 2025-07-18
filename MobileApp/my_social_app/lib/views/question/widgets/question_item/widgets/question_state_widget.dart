import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';

class QuestionStateWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionStateWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    if(question.state == QuestionStatus.solved){
      return const Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.pending,
      color: Colors.yellow,
    );
  }
}