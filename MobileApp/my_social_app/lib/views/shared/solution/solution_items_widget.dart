import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/solution/solution_item_widget.dart';

class SolutionItemsWidget extends StatelessWidget {
  final Iterable<SolutionState> solutions;
  const SolutionItemsWidget({super.key,required this.solutions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          solutions.length,
          (index) => Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: SolutionItemWidget(
              solution: solutions.elementAt(index)
            ),
          )
        ),
      ),
    );
  }
}