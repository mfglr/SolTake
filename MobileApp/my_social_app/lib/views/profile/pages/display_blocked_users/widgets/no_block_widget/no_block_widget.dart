import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'no_block_widget_texts.dart';

class NoBlockWidget extends StatelessWidget {
  const NoBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.block,
          size: 50,
        ),
        LanguageWidget(
          child: (language) => Text(
            content[language]!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              fontStyle: FontStyle.italic,
            ),
          )
        ),
      ],
    );
  }
}