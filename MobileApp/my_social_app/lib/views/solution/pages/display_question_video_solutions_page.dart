import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/solutions_state/actions.dart';
import 'package:my_social_app/state/solutions_state/selectors.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/solution_video_page_slider.dart';

class DisplayQuestionVideoSolutionsPage extends StatelessWidget {
  final int questionId;
  const DisplayQuestionVideoSolutionsPage({
    super.key,
    required this.questionId
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white.withAlpha(153),
          body: StoreConnector<AppState, Iterable<SolutionState>>(
            onInit: (store) => 
              getNextPageIfNoPage(
                store,
                selectQuestionVideoSolutionsPagination(store, questionId),
                NextQuestionVideoSolutionsAction(questionId: questionId)
              ),
            converter: (store) => selectQuestionVideoSolutions(store, questionId),
            builder: (context, solutions) => SolutionVideoPageSlider(
              solutions: solutions,
              onNext: (){
                final store = StoreProvider.of<AppState>(context, listen: false);
                getNextPageIfReady(
                  store,
                  selectQuestionVideoSolutionsPagination(store, questionId),
                  NextQuestionVideoSolutionsAction(questionId: questionId)
                );
              },
            )
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 16,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(102),
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
            ),
          ),
        )
      ],
    );
  }
}