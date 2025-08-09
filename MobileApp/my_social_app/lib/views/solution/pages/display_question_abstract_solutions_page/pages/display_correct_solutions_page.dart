import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayCorrectSolutionsPage extends StatelessWidget {
  final int questionId;
  const DisplayCorrectSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context, listen: false);
        refreshEntities(
          store,
          selectQuestionCorrectSolutionsPagination(store, questionId),
          RefreshQuestionCorrectSolutionsAction(questionId: questionId)
        );
        return onQuestionCorrectSolutionsLoaded(store, questionId);
      },
      child: StoreConnector<AppState,(KeyPagination<int>, Iterable<SolutionState>)>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionCorrectSolutionsPagination(store, questionId),
            NextQuestionCorrectSolutionsAction(questionId: questionId)
          ),
        converter: (store) => selectQuestionCorrectSolutionsAndPagination(store, questionId),
        builder: (context, data) => SolutionAbstractItems(
          data: data,
          noItems: const NoCorrectSolutionsWidget(),
          onTap: (solutionId) =>
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionCorrectSolutionsPage(
                    questionId: questionId,
                    solutionId: solutionId,
                  )
                )
              ),
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