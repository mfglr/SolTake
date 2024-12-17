import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/state.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailOrUserName;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisibility = false;

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _emailOrUserName,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                fontSize: 13
              ),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.login_form_email,
                border: const OutlineInputBorder(),
              ),
              validator: (value){
                if (value == null || value.isEmpty) return AppLocalizations.of(context)!.login_form_email_required_error;
                return null;
              },
            ),
          ),
      
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              obscureText: !_passwordVisibility,
              enableSuggestions: false,
              autocorrect: false,
              controller: _password,
              style: const TextStyle(
                fontSize: 13
              ),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.login_form_password,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => setState(() { _passwordVisibility = !_passwordVisibility; }),
                  icon: Icon(_passwordVisibility ? Icons.visibility : Icons.visibility_off),
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty) return AppLocalizations.of(context)!.login_form_password_required_error;
                if(value.length < 6) return AppLocalizations.of(context)!.login_form_password_length_error;
                return null;
              },
            ),
          ),
          
          TextButton(
            onPressed: (){
              final store = StoreProvider.of<AppState>(context,listen: false);
            },
            child: const Text("Sifremi unuttum")
          ),

          OutlinedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(LoginByPasswordAction(emailOrPassword: _emailOrUserName.text, password: _password.text));
                store.dispatch(const ChangeActiveLoginPageAction(activeLoginPage: ActiveLoginPage.appLodingPage));
              }
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
      ),
    );
  }
}