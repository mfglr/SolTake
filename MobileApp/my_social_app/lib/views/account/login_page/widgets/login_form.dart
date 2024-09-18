import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailOrUserName;
  late final TextEditingController _password;

  @override
  void initState() {
    _emailOrUserName = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailOrUserName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextField(
            controller: _emailOrUserName,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            style: const TextStyle(
              fontSize: 13
            ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.login_form_email,
              border: const OutlineInputBorder()
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
            style: const TextStyle(
              fontSize: 13
            ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.login_form_password,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        
        OutlinedButton(
          onPressed: (){
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(LoginByPasswordAction(emailOrPassword: _emailOrUserName.text, password: _password.text));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: Text(AppLocalizations.of(context)!.login_form_button)
              ),
              const Icon(Icons.login)
            ]
          )
        )
      ],
    );
  }
}