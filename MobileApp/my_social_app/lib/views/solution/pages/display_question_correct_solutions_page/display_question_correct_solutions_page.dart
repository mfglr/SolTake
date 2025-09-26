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
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page_constants.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_pagination_widget.dart';

class DisplayQuestionCorrectSolutionsPage extends StatelessWidget {
  final int questionId;
  final int containerKey;

  const DisplayQuestionCorrectSolutionsPage({
    super.key,
    required this.questionId,
    required this.containerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: title[getLanguage(context)]!,
        ),
      ),
      body: StoreConnector<AppState, ContainerPagination<int,SolutionState>>(
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionCorrectSolutions(store, questionId),
          NextQuestionCorrectSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionCorrectSolutions(store, questionId),
        builder:(context, pagination) => SolutionContainerPaginationWidget(
          noItemsWidget: const NoCorrectSolutionsWidget(),
          pagination: pagination,
          containerKey: containerKey,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionCorrectSolutions(store, questionId),
              NextQuestionCorrectSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}