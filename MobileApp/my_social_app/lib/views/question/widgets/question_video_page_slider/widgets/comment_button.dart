import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';

class CommentButton extends StatelessWidget {
  final QuestionState question;
  const CommentButton({
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
    return Column(
      children: [
        IconButton(
          onPressed: (){
            showCommentModal(context);
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(ChangeQuestionAction(question: question));
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: const Icon(
            Icons.mode_comment_outlined,
            color: Colors.white,
            size: 35,
          )
        )
      ],
    );
  }
}