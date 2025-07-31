import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/solution/pages/display_question_correct_solutions_page/display_question_correct_solutions_page_constants.dart';
import 'package:my_social_app/views/solution/widgets/no_correct_solutions_widget/no_correct_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayQuestionCorrectSolutionsPage extends StatelessWidget {
  final QuestionState question;
  final int? solutionId;

  const DisplayQuestionCorrectSolutionsPage({
    super.key,
    required this.question,
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
      body: StoreConnector<AppState,Pagination<int, SolutionState>>(
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionCorrectSolutions(store, question.id),
          NextQuestionCorrectSolutionsAction(questionId: question.id)
        ),
        converter: (store) => selectQuestionCorrectSolutions(store, question.id),
        builder:(context, pagination) => SolutionItemsWidget(
          question: question,
          noItems: NoCorrectSolutionsWidget(question: question),
          pagination: pagination,
          solutionId: solutionId,
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