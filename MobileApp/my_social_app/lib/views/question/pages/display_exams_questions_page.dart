import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/actionDispathcers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            "${AppLocalizations.of(context)!.display_exam_questions_page_exam}: ${exam.shortName}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            getPrevPageIfReady(store, exam.questions, PrevExamQuestionsAction(examId: examId));
            return store.onChange
              .map((state) => state.examEntityState.entities[examId]!.questions)
              .firstWhere((x) => !x.loadingPrev);
          },
          child: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => getNextPageIfNoPage(store,exam.questions,NextExamQuestionsAction(examId: examId)),
            converter: (store) => store.state.selectExamQuestions(examId),
            builder: (context,questions) => QuestionItemsWidget(
              questions: questions.toList(),
              pagination: exam.questions,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                getNextPageIfReady(store,exam.questions,NextExamQuestionsAction(examId: examId));
              },
            ),
          ),
        ),
      ),
    );
  }
}