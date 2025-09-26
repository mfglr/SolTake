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
import 'package:my_social_app/views/solution/widgets/no_pending_solutions_widget/no_pending_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_container_widget/solution_container_pagination_widget.dart';
import 'display_question_pending_solutions_page_constants.dart';

class DisplayQuestionPendingSolutionsPage extends StatelessWidget {
  final int questionId;
  final int containerKey;

  const DisplayQuestionPendingSolutionsPage({
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
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionPendingSolutions(store, questionId),
          NextQuestionPendingSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionPendingSolutions(store, questionId),
        builder:(context, pagination) => SolutionContainerPaginationWidget(
          noItemsWidget: const NoPendingSolutionsWidget(),
          pagination: pagination,
          containerKey: containerKey,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionPendingSolutions(store, questionId),
              NextQuestionPendingSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}