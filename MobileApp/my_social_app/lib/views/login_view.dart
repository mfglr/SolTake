import 'package:flutter/material.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/login_service.dart';
import 'package:my_social_app/services/storage/storage.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailOrUserName;
  late final TextEditingController _password;
  late final TextEditingController _passwordConfirmation;
  late final LoginService _service = getIt<LoginService>();
  late final Storage _storage = getIt<Storage>();

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
              onPressed: () async {
                account = await _service.login(_emailOrUserName.text, _password.text);
                await _storage.setLoginResponse(account!);
                
                if (!context.mounted) return;
                if(account!.emailConfirmed){
                  Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false);
                }
                else{
                  Navigator.of(context).pushNamedAndRemoveUntil('/verify-email/', (route) => false);
                }
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/register/', (route) => false 
                      );
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

