import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/solution/pages/question_solutions_page.dart/questions_solutions_page.dart';

class SolutionButton extends StatelessWidget {
  final QuestionState question;
  const SolutionButton({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => QuestionsSolutionsPage(
                questionId: question.id
              )
            )
          );
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Icon(
        Icons.border_color_outlined,
        color: Colors.white,
        size: 34,
      )
    );
  }
}