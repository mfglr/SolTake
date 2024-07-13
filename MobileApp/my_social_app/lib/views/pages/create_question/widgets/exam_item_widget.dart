import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/create_question_state/create_question_state.dart';
import 'package:my_social_app/state/store.dart';

class ExamItemWidget extends StatelessWidget {
  final String shortName;
  final String fullName;
  final Exam exam;
  const ExamItemWidget({super.key,required this.shortName,required this.fullName,required this.exam});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              store.dispatch(UpdateExamAction(exam: exam));
              Navigator.of(context).pushNamed(selectSubjectRoute);
            },
            child: Column(
              children: [
                Text(
                  shortName,
                  style: const TextStyle(fontSize: 32),
                ),
                Text(fullName)
              ],
            )
          ),
          
        ],
      ),
    );
  }
}