import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/new_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/new_questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/widgets/question_items.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'display_exam_questions_page_constant.dart';

class DisplayExamsQuestionsPage extends StatelessWidget {
  final ExamState exam;
  const DisplayExamsQuestionsPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final paginantion = selectExamQuestionPagination(store, exam.id);
        if(!paginantion.loadingNext){
          store.dispatch(RefreshExamQuestionsAction(examId: exam.id));
        }
        return onExamQuestionsLoaded(store, exam.id);
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
        body: StoreConnector<AppState, (KeyPagination<int>, Iterable<QuestionState>)>(
          onInit: (store){
            final paginantion = selectExamQuestionPagination(store, exam.id);
            if(paginantion.noPage){
              store.dispatch(NextExamQuestionsAction(examId: exam.id));
            }
          },
          converter: (store) => selectExamPaginationAndQuestions(store, exam.id),
          builder: (context, data) => QuestionItems(
            data: data,
            noQuestionContent: noExamQuestions[getLanguage(context)]!,
            onScrollBottom: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
              final paginantion = selectExamQuestionPagination(store, exam.id);
              if(paginantion.isReadyForNextPage){
                store.dispatch(NextExamQuestionsAction(examId: exam.id));
              }
            },
          ),
        ),
      )
    );
  }
}