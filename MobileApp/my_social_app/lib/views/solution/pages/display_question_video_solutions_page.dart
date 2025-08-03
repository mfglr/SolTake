import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solutions_state/actions.dart';
import 'package:my_social_app/state/app_state/solutions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/solution/widgets/solution_video_page_slider/solution_video_page_slider.dart';

class DisplayQuestionVideoSolutionsPage extends StatelessWidget {
  final QuestionState question;
  const DisplayQuestionVideoSolutionsPage({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white.withAlpha(153),
          body: StoreConnector<AppState, Pagination<int, SolutionState>>(
            onInit: (store) => 
              getNextPageIfNoPage(
                store,
                selectQuestionVideoSolutions(store, question.id),
                NextQuestionVideoSolutionsAction(questionId: question.id)
              ),
            converter: (store) => selectQuestionVideoSolutions(store, question.id),
            builder: (context, pagination) => SolutionVideoPageSlider(
              question: question,
              solutions: pagination.values,
              onNext: (){
                final store = StoreProvider.of<AppState>(context, listen: false);
                getNextPageIfReady(
                  store,
                  selectQuestionVideoSolutions(store, question.id),
                  NextQuestionVideoSolutionsAction(questionId: question.id)
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