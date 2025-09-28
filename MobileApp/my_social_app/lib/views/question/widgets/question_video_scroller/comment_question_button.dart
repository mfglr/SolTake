import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';

class CommentQuestionButton extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;
  final double size;
  final Color color;
  const CommentQuestionButton({
    super.key,
    required this.container,
    this.size = 16,
    this.color = Colors.white
  });

  void _comment(BuildContext context) =>
    Navigator
      .of(context)
      .push(ModalBottomSheetRoute(builder: (context) => DisplayQuestionCommentsModal(
        questionId: container.key
      ),isScrollControlled: true));

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