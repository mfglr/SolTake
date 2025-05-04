import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'edit_user_field_widget_texts.dart';

class EditUserFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final Function onPressed;
  
  const EditUserFieldWidget({
    super.key,
    required this.label,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(value),
              ],
            ),
            OutlinedButton(
              onPressed: () => onPressed(),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: LanguageWidget(
                      child: (langauge) => Text(
                        content[langauge]!
                      ),
                    )
                  ),
                  const Icon(Icons.edit_document,size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}