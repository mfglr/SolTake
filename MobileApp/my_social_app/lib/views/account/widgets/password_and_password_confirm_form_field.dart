import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordAndPasswordConfirmFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  const PasswordAndPasswordConfirmFormField({
    super.key,
    required this.passwordController,
    required this.passwordConfirmController
  });

  @override
  State<PasswordAndPasswordConfirmFormField> createState() => _PasswordAndPasswordConfirmFormFieldState();
}

class _PasswordAndPasswordConfirmFormFieldState extends State<PasswordAndPasswordConfirmFormField> {

  bool _passwordVisibility = false;
  bool _passwordConfirmVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextFormField(
            obscureText: !_passwordVisibility,
            enableSuggestions: false,
            autocorrect: false,
            controller: widget.passwordController,
            style: const TextStyle(
              fontSize: 13
            ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.register_password,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () => setState(() { _passwordVisibility = !_passwordVisibility; }),
                icon: Icon(_passwordVisibility ? Icons.visibility : Icons.visibility_off),
              )
            ),
            validator: (value){
              if(value == null || value.isEmpty) return AppLocalizations.of(context)!.password_required_validation;
              if(value.length < 6) return AppLocalizations.of(context)!.password_length_validation;
              return null;
            },
          ),
        ),
    
        TextFormField(
          obscureText: !_passwordConfirmVisibility,
          enableSuggestions: false,
          autocorrect: false,
          controller: widget.passwordConfirmController,
          style: const TextStyle(
            fontSize: 13
          ),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.register_password_confirmation,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () => setState(() { _passwordConfirmVisibility = !_passwordConfirmVisibility; }),
              icon: Icon(_passwordConfirmVisibility ? Icons.visibility : Icons.visibility_off),
            )
          ),
          validator: (value){
            if(value == null || value.isEmpty) return AppLocalizations.of(context)!.password_required_validation;
            if(value != widget.passwordController.text) return AppLocalizations.of(context)!.password_and_password_cofirm_validation;
            return null;
          },
        ),
      ],
    );
  }
}