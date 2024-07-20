import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/store.dart';

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
              Navigator.of(context).pushNamed(selectSubjectRoute);
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