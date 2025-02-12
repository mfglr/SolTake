import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateSolutionButton extends StatelessWidget {
  final String prompt;
  const CreateSolutionButton({
    super.key,
    required this.prompt
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop((prompt: prompt)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const FaIcon(FontAwesomeIcons.robot)
          ),
          const Text("Create Solution")
        ],
      )
    );
  }
}