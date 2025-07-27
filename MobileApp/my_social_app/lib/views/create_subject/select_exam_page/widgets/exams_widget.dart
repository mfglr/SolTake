import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/views/create_subject/select_exam_page/widgets/exam_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class ExamsWidget extends StatelessWidget {
  final Iterable<ExamState> exams;
  const ExamsWidget({
    super.key,
    required this.exams,
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: exams.map((e) => ExamWidget(
        exam: e,
      ))
    );
  }
}