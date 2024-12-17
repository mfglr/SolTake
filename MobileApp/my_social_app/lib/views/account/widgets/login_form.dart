import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/account/pages/generate_password_reset_token_page.dart';
import 'package:my_social_app/views/account/widgets/email_form_field.dart';


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
            child: EmailFormField(controller: _emailOrUserName,isUserName: true)
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
                if(value == null || value.isEmpty) return AppLocalizations.of(context)!.password_required_validation;
                if(value.length < 6) return AppLocalizations.of(context)!.password_length_validation;
                return null;
              },
            ),
          ),
          
          TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GeneratePasswordResetTokenPage()));
            },
            child: Text(AppLocalizations.of(context)!.login_form_forgot_password)
          ),

          OutlinedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(LoginByPasswordAction(emailOrPassword: _emailOrUserName.text, password: _password.text));
                store.dispatch(const ChangeActiveAccountPageAction(activeAcountPage: ActiveAccountPage.appLodingPage));
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