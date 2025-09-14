import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/packages/entity_state/key_pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page_constants.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_items/solution_items.dart';

class DisplayQuestionCorrectSolutionsPage extends StatelessWidget {
  final int questionId;
  final int? solutionId;

  const DisplayQuestionCorrectSolutionsPage({
    super.key,
    required this.questionId,
    this.solutionId,
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
      body: StoreConnector<AppState, (KeyPagination<int>, Iterable<SolutionState>)>(
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionCorrectSolutionsPagination(store, questionId),
          NextQuestionCorrectSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionCorrectSolutionsAndPagination(store, questionId),
        builder:(context, data) => SolutionItems(
          noItems: const NoCorrectSolutionsWidget(),
          data: data,
          solutionId: solutionId,
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionCorrectSolutionsPagination(store, questionId),
              NextQuestionCorrectSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}