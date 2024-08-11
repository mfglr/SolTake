import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/views/create_question/pages/select_subject_page.dart';

class ExamItemWidget extends StatelessWidget {
  final ExamState exam;
  const ExamItemWidget({super.key,required this.exam});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              store.dispatch(UpdateExamAction(examId: exam.id));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectSubjectPage()));
            },
            child: Column(
              children: [
                Text(
                  exam.shortName,
                  style: const TextStyle(fontSize: 32),
                ),
                Text(exam.fullName)
              ],
            )
          ),
        ],
      ),
    );
  }
}