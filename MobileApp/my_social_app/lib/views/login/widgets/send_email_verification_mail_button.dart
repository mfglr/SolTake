import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/utilities/toast_creator.dart';

class SendEmailVerificationMailButton extends StatelessWidget {
  const SendEmailVerificationMailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8) ,
          child: Text(AppLocalizations.of(context)!.send_eamil_confirmation_mail_button_label),
        ),
        OutlinedButton(
          onPressed: () => 
            UserService()
            .updateEmailVerificationToken()
            .then((_){
              if(context.mounted){
                ToastCreator.displaySuccess(AppLocalizations.of(context)!.send_eamil_confirmation_mail_button_success);
              }
            }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: Text(AppLocalizations.of(context)!.send_email_confirmation_mail_button_content)
              ),
              const Icon(Icons.email)
            ],
          )
        ),
      ],
    );
  }
}