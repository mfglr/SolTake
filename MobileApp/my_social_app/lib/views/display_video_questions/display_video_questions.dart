import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/question_video_page_slider.dart';

class DisplayVideoQuestions extends StatelessWidget {
  const DisplayVideoQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(77),
      body: StoreConnector<AppState,Pagination<int, QuestionState>>(
        onInit: (store) => getNextPageIfNoPage(store, selectVideoQuestions(store), const NextVideoQuestionsAction()),
        converter: (store) => selectVideoQuestions(store),
        builder: (context, pagination) => QuestionVideoPageSlider(
          questions: pagination.values,
          onNext: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(store, selectVideoQuestions(store), const NextVideoQuestionsAction());
          },
        )
      ),
    );
  }
}