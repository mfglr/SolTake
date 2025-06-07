import 'package:flutter/material.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
import 'package:soltake_broker/views/question/widgets/question_widget.dart';
import 'package:soltake_broker/views/shared/app_column.dart';

class QuestionsWidget extends StatelessWidget {
  final Iterable<QuestionState> questions;
  const QuestionsWidget({
    super.key,
    required this.questions
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: questions.map((e) => QuestionWidget(question: e)),
    );
  }
}