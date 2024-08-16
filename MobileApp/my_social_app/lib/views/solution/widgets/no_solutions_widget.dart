import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

class NoSolutionsWidget extends StatelessWidget {
  final QuestionState question;
  const NoSolutionsWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    if(question.isOwner){
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oh No!!! No Solutions Yet!!!😢",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            Text(
              "Dont Worry! Your question will be solved soon.🤞",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30
              ),
            )
          ],
        ),
      );
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Solutions Yet!!!😢",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Text(
             "Be the first to solve this question.👍",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            ),
          )
        ],
      ),
    );
  }
}