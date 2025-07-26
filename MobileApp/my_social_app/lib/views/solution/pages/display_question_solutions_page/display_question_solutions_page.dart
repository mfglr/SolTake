import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_question_solutions/no_question_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';
import 'display_question_solutions_page_constants.dart';

class DisplayQuestionSolutionsPage extends StatelessWidget {
  final QuestionState question;
  final int? solutionId;

  const DisplayQuestionSolutionsPage({
    super.key,
    required this.question,
    this.solutionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          title[getLanguage(context)]!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StoreConnector<AppState, Pagination<int,SolutionState>>(
        onInit: (store) => 
        getNextPageIfNoPage(
          store,
          selectQuestionSolutions(store, question.id),
          NextQuestionSolutionsAction(questionId: question.id)
        ),
        converter: (store) => selectQuestionSolutions(store, question.id),
        builder:(context, pagination) => SolutionItemsWidget(
          question: question,
          noItems: NoQuestionSolutions(question: question),
          pagination: pagination,
          solutionId: solutionId,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionSolutions(store, question.id),
              NextQuestionSolutionsAction(questionId: question.id)
            );
          },
        )
      ),
    );
  }
}