import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/shared/question/question_abstract_item_widget.dart';

class QuestionAbstractItemsWidget extends StatelessWidget {
  final Iterable<QuestionState> questions;
  const QuestionAbstractItemsWidget({super.key,required this.questions});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        questions.length,
        (index) => QuestionAbstractItemWidget(question: questions.elementAt(index))
      ),
    );
  }
}