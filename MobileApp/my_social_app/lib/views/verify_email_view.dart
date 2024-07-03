import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/providers/account_provider.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late final TextEditingController _token;
  final AccountProvider _stateManager = AccountProvider();

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: const Text(
                "We have been sent a mail to confirm your email. Please type the code in the mail.",
                textAlign: TextAlign.center,
              )
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                controller: _token,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter the code."
                ),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
              child: OutlinedButton(
                onPressed: () async {
                  await _stateManager.confirmEmailByToken(_token.text);
                  
                  if (!context.mounted) return;
                  Navigator.of(context).pushNamedAndRemoveUntil(rootRoute, (route) => false);
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: const Text("Verify Email")
                    ),
                    const Icon(Icons.verified)
                  ],
                )
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8) ,
              child: const Text("Didn't you receive the email?"),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
              child: OutlinedButton(
                onPressed: () async {
                  await _stateManager.sendEmailConfirmationByTokenMail();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: const Text("Resend Email")
                    ),
                    const Icon(Icons.email)
                  ],
                )
              ),
            ),

            Column(
              children: [
                const Text("Do you have an account? Login."),
                OutlinedButton(
                  onPressed: () async {
                    await _stateManager.logOut();
                    if(!context.mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
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
                const Text("Go back to register page."),
                OutlinedButton(
                  onPressed: () async {
                    await _stateManager.logOut();
                    if(!context.mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil( registerRoute, (route) => false );
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
          ],
        ),
      ),
    );
  }
}
