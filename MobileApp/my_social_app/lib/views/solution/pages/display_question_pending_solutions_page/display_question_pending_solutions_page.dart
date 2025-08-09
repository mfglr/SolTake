import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_pending_solutions_widget/no_pending_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_items/solution_items.dart';
import 'display_question_pending_solutions_page_constants.dart';

class DisplayQuestionPendingSolutionsPage extends StatelessWidget {
  final int questionId;
  final int? solutionId;

  const DisplayQuestionPendingSolutionsPage({
    super.key,
    required this.questionId,
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
      body: StoreConnector<AppState, (KeyPagination<int>, Iterable<SolutionState>)>(
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionPendingSolutionsPagination(store, questionId),
          NextQuestionPendingSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionPendingSolutionsAndPagination(store, questionId),
        builder:(context, data) => SolutionItems(
          noItems: const NoPendingSolutionsWidget(),
          data: data,
          solutionId: solutionId,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionPendingSolutionsPagination(store, questionId),
              NextQuestionPendingSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}