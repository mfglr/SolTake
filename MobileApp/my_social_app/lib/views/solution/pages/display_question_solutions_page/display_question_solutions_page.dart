import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_question_solutions/no_question_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_pagination_widget.dart';
import 'display_question_solutions_page_constants.dart';

class DisplayQuestionSolutionsPage extends StatelessWidget {
  final int questionId;
  final int containerKey;

  const DisplayQuestionSolutionsPage({
    super.key,
    required this.questionId,
    required this.containerKey,
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
      body: StoreConnector<AppState, ContainerPagination<int, SolutionState>>(
        onInit: (store) => 
        getNextPageIfNoPage(
          store,
          selectQuestionSolutions(store, questionId),
          NextQuestionSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionSolutions(store, questionId),
        builder:(context, pagination) => SolutionContainerPaginationWidget(
          noItemsWidget: Container(
            margin: const EdgeInsets.only(top: 50),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoQuestionSolutions(),
              ],
            ),
          ),
          pagination: pagination,
          containerKey: containerKey,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionSolutions(store, questionId),
              NextQuestionSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}