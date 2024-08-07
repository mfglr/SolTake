import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplaySubjectQuestionsPage extends StatelessWidget {
  final SubjectState subject;

  const DisplaySubjectQuestionsPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          "Subject: ${subject.name}",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: StoreConnector<AppState,Iterable<QuestionState>>(
        onInit: (store) => store.dispatch(NextPageOfSubjectQuestionsIfNoQuestionsAction(subjectId: subject.id)),
        converter: (store) => store.state.questionEntityState.selectQuestionsBySubjectId(subject.id),
        builder: (context,questions) => QuestionItemsWidget(
          questions: questions.toList(),
        ),
      ),
    );
  }
}