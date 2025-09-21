import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_status.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/comment/modals/display_question_comments_modal.dart';

class QuestionCommentButtonWidget extends StatelessWidget {
  final EntityContainer<int, QuestionState> container;

  static const _loadException = {
    Languages.en: "You can’t comment on the question that is being uploaded.",
    Languages.tr: "Yüklenen soruya yorum yapamazsın"
  };

  const QuestionCommentButtonWidget({
    super.key,
    required this.container
  });

  void showCommentModal(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DisplayQuestionCommentsModal(questionId: container.key),
      isDismissible: true
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = container.entity!;
    return TextButton(
      onPressed: (){
        if(container.status != EntityStatus.loadSuccess){
          throw _loadException[getLanguage(context)]!;
        }
        showCommentModal(context);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
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