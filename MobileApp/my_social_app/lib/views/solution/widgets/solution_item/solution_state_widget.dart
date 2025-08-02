import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/mark_solution_as_correct_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/mark_solution_as_incorrect_button.dart';

class SolutionStateWidget extends StatelessWidget {
  final QuestionState question;
  final SolutionState solution;
  const SolutionStateWidget({
    super.key,
    required this.question,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    switch(solution.state){
      case SolutionStatus.correct:
        return const Icon(
          Icons.done,
          size: 25,
          color: Colors.green,
        );
      case SolutionStatus.incorrect:
        return const Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        );
      default:
        return StoreConnector<AppState,num>(
          converter: (store) => store.state.login.login!.id,
          builder:(context,accountId) => Builder(
            builder: (context) {
              if(accountId == question.userId){
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: MarkSolutionAsCorrectButton(question: question, solution: solution),
                    ),
                    MarkSolutionAsIncorrectButton(question: question, solution: solution)
                  ],
                );
              }
              return const Icon(
                Icons.pending,
                size: 25,
                color: Colors.yellow,
              );
            }
          ),
        );
        
    }
  }
}