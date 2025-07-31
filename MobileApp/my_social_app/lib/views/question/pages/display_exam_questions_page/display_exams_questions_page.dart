import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'display_exam_questions_page_constant.dart';

class DisplayExamsQuestionsPage extends StatelessWidget {
  final ExamState exam;
  const DisplayExamsQuestionsPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectExamQuestions(store, exam.id),
          RefreshExamQuestionsAction(examId: exam.id)
        );
        return store.onChange
          .map((state) => state.questions.examQuestions[exam.id]!)
          .firstWhere((x) => !x.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: Text(
            "${title[getLanguage(context)]}: ${exam.initialism}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Pagination<int, QuestionState>>(
          onInit: (store) => getNextPageIfNoPage(
            store,
            selectExamQuestions(store, exam.id),
            NextExamQuestionsAction(examId: exam.id)
          ),
          converter: (store) => selectExamQuestions(store, exam.id),
          builder: (context, pagination) => QuestionItemsWidget(
            pagination: pagination,
            noQuestionContent: noExamQuestions[getLanguage(context)]!,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              getNextPageIfReady(
                store,
                selectExamQuestions(store, exam.id),
                NextExamQuestionsAction(examId: exam.id)
              );
            },
          ),
        ),
      )
    );
  }
}