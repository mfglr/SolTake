import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/widgets/question_item/question_item_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class QuestionListWidget extends StatelessWidget {
  final Iterable<QuestionState> questions;
  const QuestionListWidget({super.key,required this.questions});

  @override
  Widget build(BuildContext context) =>
    AppColumn(
      children: questions.map((question) => QuestionItemWidget(question: question))
    );
}