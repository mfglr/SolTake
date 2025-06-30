import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

class ExamWidget extends StatelessWidget {
  final ExamState exam;
  final void Function(ExamState item) selectExam;
  const ExamWidget({
    super.key,
    required this.exam,
    required this.selectExam,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => selectExam(exam),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              exam.initialism,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18
              ),
            ),
          ),
        ],
      ),
    );
  }
}