import 'package:flutter/material.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/views/create_topic/select_subject_page/widgets/subject_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class SubjectsWidget extends StatelessWidget {
  final Iterable<SubjectState> subjects;
  const SubjectsWidget({
    super.key,
    required this.subjects
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: subjects.map((e) => SubjectWidget(subject: e))
    );
  }
}