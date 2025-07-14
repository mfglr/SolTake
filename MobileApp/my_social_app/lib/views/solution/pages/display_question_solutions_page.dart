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
import 'package:my_social_app/views/solution/widgets/no_solutions_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayQuestionSolutionsPage extends StatelessWidget {
  final int questionId;
  final int? solutionId;

  const DisplayQuestionSolutionsPage({
    super.key,
    required this.questionId,
    this.solutionId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          AppLocalizations.of(context)!.display_question_solutions_page_title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StoreConnector<AppState, Pagination<int,SolutionState>>(
        onInit: (store) => 
        getNextPageIfNoPage(
          store,
          selectQuestionSolutions(store, questionId),
          NextQuestionSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionSolutions(store, questionId),
        builder:(context, pagination) => Builder(
          builder: (context) {
            if(pagination.isEmpty){
              return const NoSolutionsWidget();
            }
            return SolutionItemsWidget(
              pagination: pagination,
              solutionId: solutionId,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(
                  store,
                  selectQuestionSolutions(store, questionId),
                  NextQuestionSolutionsAction(questionId: questionId)
                );
              },
            );
          }
        )
      ),
    );
  }
}