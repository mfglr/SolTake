import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayQuestionPendingSolutionsPage extends StatelessWidget {
  final QuestionState question;
  final int? solutionId;


  const DisplayQuestionPendingSolutionsPage({
    super.key,
    required this.question,
    this.solutionId,
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
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            AppLocalizations.of(context)!.display_question_pending_solutions_page_title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState, Pagination<int,SolutionState>>(
          onInit: (store) => getNextPageIfNoPage(
            store,
            selectQuestionPendingSolutionsKeyPagination(store, question.id),
            NextQuestionPendingSolutionsAction(questionId: question.id)
          ),
          converter: (store) => selectQuestionPendingSolutionsPagination(store, question.id),
          builder:(context, pagination) => Builder(
            builder: (context) {
              if(pagination.isEmpty){
                return NoSolutions(
                  text: AppLocalizations.of(context)!.display_question_pending_solutions_page_no_solutions,
                );
              }
              return SolutionItemsWidget(
                question: question,
                pagination: pagination,
                solutionId: solutionId,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  getNextPageIfReady(
                    store,
                    selectQuestionPendingSolutionsKeyPagination(store, question.id),
                    NextQuestionPendingSolutionsAction(questionId: question.id)
                  );
                },
              );
            }
          )
        ),
      ),
    );
  }
}