import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/question_user_complaints_state/question_user_complaint_state.dart';
import 'package:soltake_broker/views/complaints/pages/question_complaints_page/widgets/question_complaint_widget/question_complaint_widget.dart';
import 'package:soltake_broker/views/shared/app_column.dart';

class QuestionComplaintsWidget extends StatelessWidget {
  final Iterable<QuestionUserComplaintState> questionComplaints;
  
  const QuestionComplaintsWidget({
    super.key,
    required this.questionComplaints
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: questionComplaints.map((e) => QuestionComplaintWidget(questionUserComplaint: e))
    );
  }
}