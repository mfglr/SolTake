import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/views/create_subject/create_subject_page/create_subject_page.dart';

class ExamWidget extends StatelessWidget {
  final ExamState exam;
  const ExamWidget({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => const CreateSubjectPage()))
              .then((value){
                if(value != null && context.mounted){
                  Navigator.of(context).pop((name: value, exam: exam));
                }
              }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    exam.initialism,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  Text(
                    exam.name,
                    style: const TextStyle(
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}