import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailOrUserName;
  late final TextEditingController _password;
  late final TextEditingController _passwordConfirmation;

  @override
  void initState() {
    _emailOrUserName = TextEditingController();
    _password = TextEditingController();
    _passwordConfirmation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailOrUserName.dispose();
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
                controller: _emailOrUserName,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter your email or username.",
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
            
            OutlinedButton(
              onPressed: (){
                store.dispatch(LoginByPasswordAction(emailOrPassword: _emailOrUserName.text, password: _password.text));
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
      
            Container(
              padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Column(
                children: [
                  const Text("Don't you have an account? Register."),
                  OutlinedButton(
                    onPressed: () {
                      store.dispatch(const ChangeActiveLoginPageAction(payload: ActiveLoginPage.registerPage));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: const Text("REGISTER")
                        ),
                        const Icon(Icons.create)
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

