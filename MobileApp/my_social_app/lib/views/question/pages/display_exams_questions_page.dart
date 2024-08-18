import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';

class DisplayExamsQuestionsPage extends StatelessWidget {
  final int examId;
  const DisplayExamsQuestionsPage({super.key,required this.examId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ExamState>(
      converter: (store) => store.state.examEntityState.entities[examId]!,
      builder: (context,exam) => Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "Exam: ${exam.shortName}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Iterable<QuestionState>>(
          onInit: (store) => store.dispatch(GetNextPageExamQuestionsIfNoPageAction(examId: examId)),
          converter: (store) => store.state.selectExamQuestions(examId),
          builder: (context,questions) => QuestionItemsWidget(
            questions: questions.toList(),
            pagination: exam.questions,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(GetNextPageExamQuestionsIfReadyAction(examId: examId));
            },
          ),
        ),
      ),
    );
  }
}