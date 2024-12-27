import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/solution_video_page_slider.dart';

class DisplayQuestionVideoSolutions extends StatelessWidget {
  final int questionId;
  const DisplayQuestionVideoSolutions({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Iterable<SolutionState>>(
      onInit: (store) => getNextPageIfNoPage(store,store.state.videoQuestions,NextQuestionVideoSolutionsAction(questionId: questionId)),
      converter: (store) => store.state.selectQuestionVideoSolutions(questionId),
      builder: (context,solutions) => SolutionVideoPageSlider(
        solutions: solutions,
        onNext: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(store,store.state.videoQuestions,NextQuestionVideoSolutionsAction(questionId: questionId));
        },
      )
    );
  }
}