import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _validCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
String _removeInvalidChracters(String value){
  String r = "";
  for(int i = 0; i < value.length; i++){
    if(_validCharacters.contains(value[i])){
      r += value[i];
    }
  }
  return r;
}

class TokenFormField extends StatelessWidget {
  final TextEditingController controller;
  const TokenFormField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      controller: controller,
      style: const TextStyle(
        fontSize: 13
      ),
      maxLength: 6,
      onChanged: (value) => controller.text = _removeInvalidChracters(value).toUpperCase(),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context)!.token_form_field_placeholder
      ),
      validator: (value){
        if(value == null || value.isEmpty) return AppLocalizations.of(context)!.token_form_field_token_required_error_message;
        if(value.length != 6) return AppLocalizations.of(context)!.token_form_field_token_length_error_message;
        return null;
      },
    );
  }
}