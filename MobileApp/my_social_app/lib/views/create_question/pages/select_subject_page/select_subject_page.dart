import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/create_question/pages/select_subject_page/widgets/create_subject_button/create_subject_button.dart';
import 'package:my_social_app/views/create_question/widgets/subject_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

import 'select_subject_page_texts.dart';

class SelectSubjectPage extends StatefulWidget {
  final ExamState exam;
  const SelectSubjectPage({
    super.key,
    required this.exam
  });

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ExamState?>(
      onInit: (store) => store.dispatch(LoadExamAction(examId: widget.exam.id)),
      converter: (store) => store.state.examEntityState.getValue(widget.exam.id),
      builder:(store,exam){
        if(exam == null) return const LoadingView(); 
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: LanguageWidget(
              child: (language) => AppTitle(
                title: title[language]!
              ),
            ),
            actions: [
              CreateSubjectButton(exam: exam,)
            ],
          ),
          body:StoreConnector<AppState,Iterable<SubjectState>>(
            onInit: (store) => getNextPageIfNoPage(store, exam.subjects, NextExamSubjectsAction(examId: exam.id)),
            converter: (store) => store.state.selectExamSubjects(widget.exam.id),
            builder:(context,subjects){
              if(exam.subjects.loadingNext) return const LoadingWidget();
              return GridView.count(
                crossAxisCount: 2,
                children: List<Widget>.generate(
                  subjects.length,(index) => SubjectItemWidget(
                    subject: subjects.elementAt(index),
                  )
                )
              );
            }
          ),
        );
      }
    );
  }
}