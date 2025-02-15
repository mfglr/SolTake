import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/account/pages/reset_password_page.dart';
import 'package:my_social_app/views/account/widgets/email_form_field.dart';


class GeneratePasswordResetTokenForm extends StatefulWidget {
  const GeneratePasswordResetTokenForm({super.key});

  @override
  State<GeneratePasswordResetTokenForm> createState() => _GeneratePasswordResetTokenFormState();
}

class _GeneratePasswordResetTokenFormState extends State<GeneratePasswordResetTokenForm> {
  late final TextEditingController _email;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
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
            child: EmailFormField(controller: _email)
          ),
      
          OutlinedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                UserService()
                  .generateResetPasswordToken(_email.text)
                  .then((_){
                    if(context.mounted){
                      ToastCreator
                        .displaySuccess(AppLocalizations.of(context)!.generate_password_reset_token_email_created_notification_message);
                    }
                  });
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => ResetPasswordPage(email: _email.text)));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Text(AppLocalizations.of(context)!.generate_password_reset_token_send_email_button_content)
                ),
                const Icon(Icons.mail)
              ]
            )
          )
          
        ],
      ),
    );
  }
}