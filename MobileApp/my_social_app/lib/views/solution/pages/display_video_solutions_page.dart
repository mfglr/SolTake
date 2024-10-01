import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/solution/widgets/no_solutions.dart';
import 'package:my_social_app/views/solution/widgets/solution_items_widget.dart';

class DisplayVideoSolutionsPage extends StatelessWidget {
  final int questionId;
  const DisplayVideoSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: questionId)),
      converter: (store) => store.state.questionEntityState.entities[questionId],
      builder: (context,question){
        if(question == null) return const LoadingView();
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.display_video_solutions_page_title
            ),
          ),
          body: StoreConnector<AppState,Iterable<SolutionState>>(
            onInit: (store) => store.dispatch(GetNextPageQuestionVideoSolutionsIfNoPageAction(questionId: questionId)),
            converter: (store) => store.state.selectQuestionVideoSolutions(questionId),
            builder: (context,solutions){
              if(question.videoSolutions.ids.isEmpty && question.videoSolutions.isLast){
                return NoSolutions(
                  text: AppLocalizations.of(context)!.display_video_solutions_page_no_solutions
                );
              }
              return SolutionItemsWidget(
                solutions: solutions,
                pagination: question.videoSolutions,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(GetNextPageQuestionVideoSolutionsIfReadyAction(questionId: questionId));
                },
              );
            }
          ),
        );
      }
    );
  }
}