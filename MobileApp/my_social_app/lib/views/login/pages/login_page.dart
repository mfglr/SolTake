import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/login/pages/register_page.dart';
import 'package:my_social_app/views/login/widgets/login_form.dart';
import 'package:my_social_app/views/login/widgets/google_login_button.dart';
import 'package:my_social_app/views/login/widgets/login_page_diveder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginForm(),

            const Padding(
              padding: EdgeInsets.only(left: 48,right: 48, top:20, bottom: 20),
              child: LoginPageDiveder()
            ),

            const GoogleLoginButton(),

            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () =>
                      Navigator
                        .of(context)
                        .pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                          (_) => false
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          child: Text(AppLocalizations.of(context)!.login_register_button)
                        ),
                        const Icon(Icons.email)
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

