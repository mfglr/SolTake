import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/key_pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_incorrect_solutions_page/display_question_incorrect_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_incorrect_solutions_widget/no_incorrect_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayIncorrectSolutionsPage extends StatelessWidget {
  final int questionId;
  const DisplayIncorrectSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectQuestionIncorrectSolutionsPagination(store, questionId),
          RefreshQuestionIncorrectSolutionsAction(questionId: questionId)
        );
        return onQuestionIncorrectSolutionsLoaded(store, questionId);
      },
      child: StoreConnector<AppState, (KeyPagination<int>, Iterable<SolutionState>)>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionIncorrectSolutionsPagination(store, questionId),
            NextQuestionIncorrectSolutionsAction(questionId: questionId)
          ),
        converter: (store) => selectQuestionIncorrectSolutionsAndPagination(store, questionId),
        builder: (context, data) => SolutionAbstractItems(
          data: data,
          noItems: const NoIncorrectSolutionsWidget(),
          onTap: (solutionId) =>
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionIncorrectSolutionsPage(
                    questionId: questionId,
                    solutionId: solutionId,
                  )
                )
              ),
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionIncorrectSolutionsPagination(store, questionId),
              NextQuestionIncorrectSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}