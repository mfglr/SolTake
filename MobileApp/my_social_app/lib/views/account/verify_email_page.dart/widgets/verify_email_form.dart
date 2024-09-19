import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

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
          
          TextFormField(
            enableSuggestions: false,
            autocorrect: false,
            controller: _token,
            style: const TextStyle(
              fontSize: 13
            ),
            maxLength: 6,
            onChanged: (value) => _token.text = _removeInvalidChracters(value).toUpperCase(),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: AppLocalizations.of(context)!.verify_email_form_code
            ),
            validator: (value){
              if(value == null || value.isEmpty) return "Token is required!";
              if(value.length != 6) return "Token must be 6 characters long!";
              return null;
            },
          ),
          
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