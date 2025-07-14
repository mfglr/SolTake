import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart' show SolutionAbstractItems;

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
          selectQuestionPendingSolutions(store, questionId),
          RefreshQuestionPendingSolutionsAction(questionId: questionId)
        );
        return store.onChange.map((state) => !selectQuestionPendingSolutionsFromState(state.solutions,questionId).loadingNext).first;
      },
      child: StoreConnector<AppState,Pagination<int,SolutionState>>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionPendingSolutions(store, questionId),
            NextQuestionPendingSolutionsAction(questionId: questionId)
          ),
        converter: (store) => selectQuestionPendingSolutions(store, questionId),
        builder: (context, pagination) => SolutionAbstractItems(
          pagination: pagination,
          noItems: const NoSolutionsWidget(),
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
              selectQuestionPendingSolutions(store, questionId),
              NextQuestionPendingSolutionsAction(questionId: questionId)
            );
          },
        )
      ),
    );
  }
}