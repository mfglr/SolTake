import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_scroller/solution_video_scroller.dart';

import 'display_question_video_solutions_page_constants.dart';

class DisplayQuestionVideoSolutionsPage extends StatelessWidget {
  final int questionId;  
  const DisplayQuestionVideoSolutionsPage({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          title: title[getLanguage(context)]!,
        ),
        leading: const AppBackButtonWidget(),
      ),
      body: StoreConnector<AppState, ContainerPagination<int, SolutionState>>(
        onInit: (store) => getNextEntitiesIfNoPage(
          store,
          selectQuestionVideoSolutions(store, questionId),
          NextQuestionVideoSolutionsAction(questionId: questionId)
        ),
        converter: (store) => selectQuestionVideoSolutions(store, questionId),
        builder: (context, pagination) => SolutionVideoScroller(
          containers: pagination.containers,
          onNext: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextEntitiesIfReady(
              store,
              selectQuestionVideoSolutions(store, questionId),
              NextQuestionVideoSolutionsAction(questionId: questionId)
            );
          },
        ),
      ),
    );
  }
}