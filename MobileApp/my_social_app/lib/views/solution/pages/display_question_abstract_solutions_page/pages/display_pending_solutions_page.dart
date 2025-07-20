import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_pending_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayPendingSolutionsPage extends StatelessWidget {
  final QuestionState question;
  const DisplayPendingSolutionsPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectQuestionPendingSolutionsKeyPagination(store, question.id),
          RefreshQuestionPendingSolutionsAction(questionId: question.id)
        );
        return onQuestionPendingSolutionsLoaded(store, question.id);
      },
      child: StoreConnector<AppState,Pagination<int,SolutionState>>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionPendingSolutionsKeyPagination(store, question.id),
            NextQuestionPendingSolutionsAction(questionId: question.id)
          ),
        converter: (store) => selectQuestionPendingSolutionsPagination(store, question.id),
        builder: (context, pagination) => SolutionAbstractItems(
          pagination: pagination,
          noItems: const NoSolutionsWidget(),
          onTap: (solutionId) =>
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionPendingSolutionsPage(
                    question: question,
                    solutionId: solutionId,
                  )
                )
              ),
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionPendingSolutionsPagination(store, question.id),
              NextQuestionPendingSolutionsAction(questionId: question.id)
            );
          },
        )
      ),
    );
  }
}