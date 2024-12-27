import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/video_questions_state/actions.dart';
import 'package:my_social_app/views/question/widgets/question_video_page_slider/question_video_page_slider.dart';

class DisplayVideoQuestions extends StatelessWidget {
  const DisplayVideoQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(77),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => getNextPageIfNoPage(store,store.state.videoQuestions, const NextVideoQuestionsAction()),
        converter: (store) => store.state.selectVideoQuestions,
        builder: (context,questions) => QuestionVideoPageSlider(
          questions: questions,
          onNext: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getNextPageIfReady(store, store.state.videoQuestions, const NextVideoQuestionsAction());
          },
        )
      ),
    );
  }
}