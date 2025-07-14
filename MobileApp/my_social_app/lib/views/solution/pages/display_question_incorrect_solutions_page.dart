import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayQuestionIncorrectSolutionsPage extends StatelessWidget {
  final int questionId;
  final int? solutionId;
  const DisplayQuestionIncorrectSolutionsPage({
    super.key,
    required this.questionId,
    this.solutionId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(
          title: AppLocalizations.of(context)!.display_question_incorrect_solutions_page_title,
        ),
      ),
      body: StoreConnector<AppState, Pagination<int,SolutionState>>(
        onInit: (store) => getNextPageIfNoPage(
          store,
          selectQuestionIncorrectSolutions(store, questionId),
          NextQuestionIncorrectSolutionsAction(questionId: questionId),
        ),
        converter: (store) => selectQuestionIncorrectSolutions(store, questionId),
        builder:(context, pagination) => Builder(
          builder: (context) {
            if(pagination.isEmpty){
              return NoSolutions(
                text: AppLocalizations.of(context)!.display_question_incorrect_solutions_page_not_solutions
              );
            }
            return SolutionItemsWidget(
              pagination: pagination,
              solutionId: solutionId,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(
                  store,
                  selectQuestionIncorrectSolutions(store, questionId),
                  NextQuestionIncorrectSolutionsAction(questionId: questionId),
                );
              },
            );
          }
        )
      ),
    );
  }
}