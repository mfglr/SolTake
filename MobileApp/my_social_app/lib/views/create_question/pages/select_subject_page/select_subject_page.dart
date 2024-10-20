import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/create_question/pages/select_subject_page/widgets/subject_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class SelectSubjectPage extends StatefulWidget {
  final int examId;
  const SelectSubjectPage({
    super.key,
    required this.examId
  });

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ExamState?>(
      onInit: (store) => store.dispatch(LoadExamAction(examId: widget.examId)),
      converter: (store) => store.state.examEntityState.entities[widget.examId],
      builder:(store,exam){
        if(exam == null) return const LoadingView(); 
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: AppTitle(
              title: AppLocalizations.of(context)!.select_subject_page_title
            ),
          ),
          body:StoreConnector<AppState,Iterable<SubjectState>>(
            onInit: (store) => getNextPageIfNoPage(store, exam.subjects, NextExamSubjectsAction(examId: exam.id)),
            converter: (store) => store.state.selectExamSubjects(widget.examId),
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