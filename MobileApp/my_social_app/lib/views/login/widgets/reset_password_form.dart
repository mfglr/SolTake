import 'package:flutter/material.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/login/widgets/password_and_password_confirm_form_field.dart';
import 'package:my_social_app/views/login/widgets/token_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;
  const ResetPasswordForm({super.key,required this.email});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final TextEditingController _token;
  late final TextEditingController _password;
  late final TextEditingController _passwordConfirmation;
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    _token = TextEditingController();
    _password = TextEditingController();
    _passwordConfirmation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _token.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TokenFormField(controller: _token)
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: PasswordAndPasswordConfirmFormField(
              passwordController: _password,
              passwordConfirmController: _passwordConfirmation,
            ),
          ),

          OutlinedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                UserService()
                  .resetPassword(widget.email, _token.text, _password.text, _passwordConfirmation.text)
                  .then((_){
                    if(context.mounted){
                      ToastCreator.displaySuccess(AppLocalizations.of(context)!.reset_password_form_success_content);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                  });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: Text(AppLocalizations.of(context)!.reset_password_form_button_content)
                ),
                const Icon(Icons.update)
              ],
            )
          )
        ],
      ),
    );
  }
}