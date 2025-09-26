import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/views/question/pages/display_question_likes_page/display_question_likes_page.dart';

class DisplayQuestionLikesButton extends StatelessWidget {
  final EntityContainer<int,QuestionState> container;
  const DisplayQuestionLikesButton({
    super.key,
    required this.container
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder:(context) => DisplayQuestionLikesPage(questionId: container.key))),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        "${container.entity!.numberOfLikes.toString()} ${AppLocalizations.of(context)!.display_question_likes}",
        style: const TextStyle(
          decoration: TextDecoration.underline
        ),
      )
    );
  }
}