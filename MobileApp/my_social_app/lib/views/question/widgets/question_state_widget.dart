import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';

class QuestionStateWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionStateWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    if(question.state == QuestionStatus.solved){
      return const Text(
        "Solved",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold
        ),
      );
    }
    return const Text(
      "Unsolved",
      style: TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold
      ),
    );
  }
}