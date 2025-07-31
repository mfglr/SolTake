import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_abstract_items.dart';

class DisplayCorrectSolutionsPage extends StatelessWidget {
  final QuestionState question;
  const DisplayCorrectSolutionsPage({
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
          selectQuestionCorrectSolutions(store, question.id),
          RefreshQuestionCorrectSolutionsAction(questionId: question.id)
        );
        return store.onChange.map((state) => !selectQuestionCorrectSolutionsFromState(state.solutions,question.id).loadingNext).first;
      },
      child: StoreConnector<AppState,Pagination<int,SolutionState>>(
        onInit: (store) => 
          getNextPageIfNoPage(
            store,
            selectQuestionCorrectSolutions(store, question.id),
            NextQuestionCorrectSolutionsAction(questionId: question.id)
          ),
        converter: (store) => selectQuestionCorrectSolutions(store, question.id),
        builder: (context, pagination) => SolutionAbstractItems(
          pagination: pagination,
          noItems: NoCorrectSolutionsWidget(question: question),
          onTap: (solutionId) =>
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionCorrectSolutionsPage(
                    question: question,
                    solutionId: solutionId,
                  )
                )
              ),
          onScrollBottom: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(
              store,
              selectQuestionCorrectSolutions(store, question.id),
              NextQuestionCorrectSolutionsAction(questionId: question.id)
            );
          },
        )
      ),
    );
  }
}