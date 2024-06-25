import 'package:flutter/material.dart';
import 'package:my_social_app/initiliaze.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/storage/storage.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late final TextEditingController _token;
  final AccountService _accountService = getIt<AccountService>();
  final Storage _storage = getIt<Storage>();

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
                  final token = _token.text;
                  try{
                    await _accountService.confirmEmailByToken(token);
                    account!.confirmEmail();
                    _storage.setLoginResponse(account!);
                    
                    if (!context.mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home/', (route) => false 
                    );
                  }
                  catch(e){
                    print(e);
                  }
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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: OutlinedButton(
                onPressed: () async {
                  final AccountService accountService = getIt<AccountService>();
                  try{
                    await accountService.sendEmailConfirmationByTokenMail();
                  }
                  catch(e){
                    print(e);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: const Text("Send Email")
                    ),
                    const Icon(Icons.email)
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
