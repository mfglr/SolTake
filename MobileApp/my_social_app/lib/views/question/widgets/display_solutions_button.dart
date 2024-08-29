import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/solution/pages/questions_solutions_page.dart';

class DisplaySolutionsButton extends StatelessWidget {
  final QuestionState question;
  const DisplaySolutionsButton({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(ChangeQuestionIdAction(questionId: question.id));
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
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Text(question.numberOfSolutions.toString())
          ),
          const Icon(Icons.border_color_outlined),
        ],
      )
    );
  }
}