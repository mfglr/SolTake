import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/login/widgets/token_form_field.dart';

class VerifyEmailForm extends StatefulWidget {
  const VerifyEmailForm({super.key});

  @override
  State<VerifyEmailForm> createState() => _VerifyEmailFormState();
}

class _VerifyEmailFormState extends State<VerifyEmailForm> {
  late final TextEditingController _token;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _token = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _token.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              AppLocalizations.of(context)!.verify_email_form_label,
              textAlign: TextAlign.center,
            )
          ),
          
          TokenFormField(controller: _token),
          
          OutlinedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(ConfirmEmailByTokenAction(token: _token.text));
              }
            }, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: Text(AppLocalizations.of(context)!.verify_email_form_button)
                ),
                const Icon(Icons.verified)
              ],
            )
          ),
        ],
      )
    );
  }
}