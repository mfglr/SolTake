import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/display_question_abstract_solutions_page.dart';

class SolutionButton extends StatelessWidget {
  final QuestionState<int> question;
  const SolutionButton({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplayQuestionAbstractSolutionsPage(
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