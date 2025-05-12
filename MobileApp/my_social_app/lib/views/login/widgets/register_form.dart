import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/widgets/email_form_field.dart';
import 'package:my_social_app/views/login/widgets/password_and_password_confirm_form_field.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: EmailFormField(controller: _email),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: PasswordAndPasswordConfirmFormField(
              passwordController: _password,
              passwordConfirmController: _passwordConfirmation,
            ),
          ),

          OutlinedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(CreateUserAction(
                  email: _email.text,
                  password:_password.text,
                  passwordConfirmation:_passwordConfirmation.text
                ));
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