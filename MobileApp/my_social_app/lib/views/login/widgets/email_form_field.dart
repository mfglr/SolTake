import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isUserName;
  const EmailFormField({super.key,required this.controller,this.isUserName = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: false,
      autocorrect: false,
      style: const TextStyle(
        fontSize: 13
      ),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.register_email,
        border: const OutlineInputBorder()
      ),
      validator: (value){
        if (value == null || value.isEmpty) return AppLocalizations.of(context)!.email_required_validation;
        if(!isUserName && !EmailValidator.validate(value)) return AppLocalizations.of(context)!.email_invalid_validation;
        return null;
      },
    );
          
  }
}