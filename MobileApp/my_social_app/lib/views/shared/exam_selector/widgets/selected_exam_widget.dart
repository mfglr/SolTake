import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

class SelectedExamWidget extends StatelessWidget {
  final ExamState exam;
  final void Function(ExamState exam) removeExam;
  
  const SelectedExamWidget({
    super.key,
    required this.exam,
    required this.removeExam
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          exam.initialism,
          style: const TextStyle(
            fontSize: 13
          ),
        ),
        IconButton(
          onPressed: () => removeExam(exam),
          icon: const Icon(
            Icons.close,
            size: 18,
          )
        )
      ],
    );
  }
}