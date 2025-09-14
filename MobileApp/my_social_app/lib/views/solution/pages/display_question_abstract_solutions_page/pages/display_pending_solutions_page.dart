import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/packages/entity_state/key_pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_pending_solutions_page/display_question_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_pending_solutions_widget/no_pending_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayPendingSolutionsPage extends StatelessWidget {
  final int questionId;
  const DisplayPendingSolutionsPage({
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
          selectQuestionPendingSolutionsPagination(store, questionId),
          RefreshQuestionPendingSolutionsAction(questionId: questionId)
        );
        return onQuestionPendingSolutionsLoaded(store, questionId);
      },
      child: StoreConnector<AppState, (KeyPagination<int>, Iterable<SolutionState>)>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionPendingSolutionsPagination(store, questionId),
            NextQuestionPendingSolutionsAction(questionId: questionId)
          ),
        converter: (store) => selectQuestionPendingSolutionsAndPagination(store, questionId),
        builder: (context, data) => SolutionAbstractItems(
          data: data,
          noItems: const NoPendingSolutionsWidget(),
          onTap: (solutionId) =>
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionPendingSolutionsPage(
                    questionId: questionId,
                    solutionId: solutionId,
                  )
                )
              ),
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