import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/solution/pages/display_video_solutions_page.dart';

class DisplayVideoSolutionsButton extends StatelessWidget {
  final QuestionState question;
  const DisplayVideoSolutionsButton({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => DisplayVideoSolutionsPage(questionId: question.id))),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.video_library)
          ),
          Text(question.numberOfVideoSolutions.toString()),
        ],
      )
    );
  }
}