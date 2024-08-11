import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayQuestionSolutionsPage extends StatelessWidget {
  final QuestionState question;

  const DisplayQuestionSolutionsPage({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const Text(
          "Solutions",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      floatingActionButton: 
        !question.isOwner ? FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(addSolutionImagesRoute),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ) : null,
      body: StoreConnector<AppState,Iterable<SolutionState>>(
        onInit: (store) => store.dispatch(NextPageQuestionSolutionsAction(questionId: question.id)),
        converter: (store) => store.state.solutionEntityState.selectSolutionsByQuestionId(question.id),
        builder:(context,solutions){
          if(solutions.isNotEmpty){
            return SolutionItemsWidget(solutions: solutions);
          }
          return NoSolutionsWidget(isOwner: question.isOwner);
        },
      ),
    );
  }
}