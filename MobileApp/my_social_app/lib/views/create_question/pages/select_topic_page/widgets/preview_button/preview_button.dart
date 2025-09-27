import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'preview_button_constants.dart';

class PreviewButton extends StatelessWidget {
  final void Function() onTap;
  const PreviewButton({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content[getLanguage(context)]!,
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }
}