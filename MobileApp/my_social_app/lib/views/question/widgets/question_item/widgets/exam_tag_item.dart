import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/views/question/pages/display_exams_questions_page.dart';

class ExamTagItem extends StatelessWidget {
  final ExamState exam;
  const ExamTagItem({super.key,required this.exam});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplayExamsQuestionsPage(examId: exam.id))),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            exam.initialism,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900
            ),
          )          
        ],
      ),
    );
  }
}