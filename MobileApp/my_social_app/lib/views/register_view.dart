import 'package:flutter/material.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/storage/storage.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _passwordConfirmation;
  late final AccountService _service = getIt<AccountService>();
  late final Storage _storage = getIt<Storage>();

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
              
              onPressed: () async {
                account = await _service.signUp(_email.text,_password.text,_passwordConfirmation.text);
                await _storage.setLoginResponse(account!);

                if (!context.mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil('/verify-email/', (route) => false);
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
                      Navigator.of(context).pushNamedAndRemoveUntil('/login/', (route) => false);
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
