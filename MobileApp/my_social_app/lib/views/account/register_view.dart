import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter your email.",
                  border: OutlineInputBorder()
                ),
              ),
            ),
        
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _password,
                decoration: const InputDecoration(
                  hintText: "Enter your password.",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
        
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _passwordConfirmation,
                decoration: const InputDecoration(
                  hintText: "Re-enter your password.",
                  border: OutlineInputBorder()
                ),
              ),
            ),
        
            OutlinedButton(
              onPressed: () {
                store.dispatch(CreateAccountAction(
                  email: _email.text,password:_password.text,passwordConfirmation:_passwordConfirmation.text
                ));
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: const Text("REGISTER")
                  ), 
                  const Icon(Icons.create)
                ],
              )

            ),
        
             Container(
              padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Column(
                children: [
                  const Text("Do you have an account? Login."),
                  OutlinedButton(
                    onPressed: () {
                      store.dispatch(const ChangeActiveLoginPageAction(payload: ActiveLoginPage.loginPage));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: const Text("LOGIN")
                        ),
                        const Icon(Icons.login)
                      ]
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
