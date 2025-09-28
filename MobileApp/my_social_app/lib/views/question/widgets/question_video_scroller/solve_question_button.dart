import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/solution/pages/display_question_abstract_solutions_page/display_question_abstract_solutions_page.dart';

class SolveQuestionButton extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  final double size;
  final Color color;

  const SolveQuestionButton({
    super.key,
    required this.container,
    this.color = Colors.white,
    this.size = 16
  });

  void _solve(BuildContext context){
    Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (context) => DisplayQuestionAbstractSolutionsPage(
        questionId: container.key
      )));

  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _solve(context),
      icon: Icon(
        Icons.border_color,
        color: color,
        size: size,
      )
    );
  }
}