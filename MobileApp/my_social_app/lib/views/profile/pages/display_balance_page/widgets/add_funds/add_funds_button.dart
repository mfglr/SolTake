import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import "package:my_social_app/views/profile/pages/display_balance_page/widgets/add_funds/add_funds_button_texts.dart";
class AddFundsButton extends StatelessWidget {
  const AddFundsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (langauge) => TextButton(
        onPressed: (){},
        child: Text(content[langauge]!)
      ),
    );
  }
}