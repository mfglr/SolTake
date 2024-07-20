import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/shared/question/question_item_widget.dart';

class QuestionItemsWidget extends StatelessWidget {
  final Iterable<QuestionState> questions;
  const QuestionItemsWidget({super.key,required this.questions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          questions.length,
          (index) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: QuestionItemWidget(question: questions.elementAt(index))
          ),
        )
      ),
    );
  }
}