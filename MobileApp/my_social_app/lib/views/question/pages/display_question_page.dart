import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/question/widgets/question_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class DisplayQuestionPage extends StatelessWidget {
  final int questionId;

  const DisplayQuestionPage({super.key,required this.questionId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,QuestionState?>(
      onInit: (store) => store.dispatch(LoadQuestionAction(questionId: questionId)),
      converter: (store) => store.state.questionEntityState.entities[questionId],
      builder: (context,question) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
        ),
        body: Builder(
          builder: (context) {
            if(question == null) return const LoadingView();
            return SingleChildScrollView(
              child: QuestionItemWidget(question: question)
            );
          }
        ),
      ),
    );
  }
}