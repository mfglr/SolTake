import 'package:flutter/material.dart';
import 'package:my_social_app/views/create_exam/create_exam_page.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'create_exam_button_texts.dart';

class CreateExamButton extends StatelessWidget {
  const CreateExamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateExamPage())),
      child: LanguageWidget(
        child: (language) => Text(
          content[language]!
        )
      )
    );
  }
}