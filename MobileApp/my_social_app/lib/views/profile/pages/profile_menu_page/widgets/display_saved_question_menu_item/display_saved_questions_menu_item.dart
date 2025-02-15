import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_abstract_saved_questions_page/display_abstract_saved_questions_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/display_saved_question_menu_item/display_saves_questions_menu_item_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class DisplaySavedQuestionsMenuItem extends StatelessWidget {
  const DisplaySavedQuestionsMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        name: content[language]!,
        icon: Icons.question_mark,
        onPressed: () =>
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => const DisplayAbstractSavedQuestionsPage())),
      ),
    );
  }
}