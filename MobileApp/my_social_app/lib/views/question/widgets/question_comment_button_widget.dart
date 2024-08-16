import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';

class QuestionCommentButtonWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionCommentButtonWidget({
    super.key,
    required this.question
  });

  void showCommentModal(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DisplayQuestionCommentsModal(questionId: question.id),
      isDismissible: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        showCommentModal(context);
        store.dispatch(ChangeQuestionAction(question: question));
        store.dispatch(ChangeHintTextAction(hintText: "Comment on ${question.formatUserName(10)}' s question..."));
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.mode_comment_outlined)
          ),
          Text(question.numberOfComments.toString())
        ],
      ),
    );
  }
}