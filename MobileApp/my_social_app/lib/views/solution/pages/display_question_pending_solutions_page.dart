import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayQuestionPendingSolutionsPage extends StatelessWidget {
  final num questionId;
  final num? solutionId;

  const DisplayQuestionPendingSolutionsPage({
    super.key,
    required this.questionId,
    this.solutionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: questionId)),
      converter: (store) => store.state.questionEntityState.getValue(questionId),
      builder: (context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
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
          body: StoreConnector<AppState,Iterable<SolutionState>>(
            onInit: (store) => getNextPageIfNoPage(
              store,
              question.pendingSolutions,
              NextQuestionPendingSolutionsAction(questionId: question.id)
            ),
            converter: (store) => //store.state.selectQuestionPendingSolutions(question.id),
            [],
            builder:(context,solutions) => Builder(
              builder: (context) {
                if(question.pendingSolutions.values.isEmpty && question.pendingSolutions.isLast){
                  return NoSolutions(
                    text: AppLocalizations.of(context)!.display_question_pending_solutions_page_no_solutions,
                  );
                }
                return SolutionItemsWidget(
                  solutions: solutions,
                  pagination: question.pendingSolutions,
                  solutionId: solutionId,
                  onScrollBottom: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    getNextPageIfReady(
                      store,
                      question.pendingSolutions,
                      NextQuestionPendingSolutionsAction(questionId: question.id)
                    );
                  },
                );
              }
            )
          ),
        );
      }
    );
  }
}