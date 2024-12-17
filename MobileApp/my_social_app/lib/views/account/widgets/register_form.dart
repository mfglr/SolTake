import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:email_validator/email_validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _passwordConfirmation;
  bool _passwordVisibility = false;
  bool _passwordConfirmVisibility = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordConfirmation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              style: const TextStyle(
                fontSize: 13
              ),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.register_email,
                border: const OutlineInputBorder()
              ),
               validator: (value){
                if (value == null || value.isEmpty) return AppLocalizations.of(context)!.register_form_email_required_error;
                if(!EmailValidator.validate(value)) return AppLocalizations.of(context)!.register_form_email_invalid_error;
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
                hintText: AppLocalizations.of(context)!.register_password,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => setState(() { _passwordVisibility = !_passwordVisibility; }),
                  icon: Icon(_passwordVisibility ? Icons.visibility : Icons.visibility_off),
                )
              ),
              validator: (value){
                if(value == null || value.isEmpty) return AppLocalizations.of(context)!.register_form_password_required_error;
                if(value.length < 6) return AppLocalizations.of(context)!.register_form_password_length_error;
                return null;
              },
            ),
          ),
      
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              obscureText: !_passwordConfirmVisibility,
              enableSuggestions: false,
              autocorrect: false,
              controller: _passwordConfirmation,
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
                if(value == null || value.isEmpty) return AppLocalizations.of(context)!.register_form_password_confirm_required_error;
                if(value != _password.text) return AppLocalizations.of(context)!.register_form_password_and_password_cofirm_not_match_error;
                return null;
              },
            ),
          ),
      
          OutlinedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(CreateAccountAction(
                  email: _email.text,
                  password:_password.text,
                  passwordConfirmation:_passwordConfirmation.text
                ));
                store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.appLodingPage));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Text(AppLocalizations.of(context)!.register_button,)
                ), 
                const Icon(Icons.email)
              ],
            )
          ),
        ],
      ),
    );
  }
}