import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'no_comments_widget_texts.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LanguageWidget(
          child: (language) => Text(
            title[language]!,
            style: const TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
        ),
        LanguageWidget(
          child: (language) => Text(
            description[language]!,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}