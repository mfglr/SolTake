import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/views/create_solution_by_ai/create_prompt_page/widgets/create_solution_button/create_solution_button_contents.dart';

class CreateSolutionButton extends StatelessWidget {
  final String prompt;
  final bool isHighResulation;
  const CreateSolutionButton({
    super.key,
    required this.prompt,
    required this.isHighResulation
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop((prompt: prompt,isHighResulation: isHighResulation)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const FaIcon(FontAwesomeIcons.robot)
          ),
          Text(buttonContents[getLanguage(context)]!)
        ],
      )
    );
  }
}