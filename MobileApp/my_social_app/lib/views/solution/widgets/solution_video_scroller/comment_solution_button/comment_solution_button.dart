import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/views/comment/modals/display_solution_comments_modal.dart';
import 'comment_solution_button_constants.dart';

class CommentSolutionButton extends StatelessWidget {
  final EntityContainer<int, SolutionState> container;
  final Color color;
  final double size;
  const CommentSolutionButton({
    super.key,
    required this.container,
    this.color = Colors.white,
    this.size = 16
  });

  void _comment(BuildContext context){
    if(container.isNotLoadSuccess){
      throw loadException[getLanguage(context)]!;
    }
    Navigator
      .of(context)
      .push(ModalBottomSheetRoute(builder: (context) => DisplaySolutionCommentsModal(
        solutionId: container.key
      ),isScrollControlled: true));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _comment(context),
      icon: Icon(
        Icons.mode_comment_outlined,
        color: color,
        size: size,
      )
    );
  }
}