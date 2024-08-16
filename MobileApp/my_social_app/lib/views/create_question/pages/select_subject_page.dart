import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/views/create_question/widgets/subject_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: const Text("Select a Subject"),
      ),
      body:StoreConnector<AppState,Iterable<SubjectState>>(
        onInit: (store) => store.dispatch(const GetSubjectsOfSelectedExamAction()),
        converter: (store) => store.state.subjectsOfSelectedExam,
        builder:(context,subjects){
          return GridView.count(
            crossAxisCount: 2,
            children: List<Widget>.generate(
              subjects.length,(index) => SubjectItemWidget(subject: subjects.elementAt(index))
            )
          );
        }
      ),
    );
  }
}