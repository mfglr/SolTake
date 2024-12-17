import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/account/widgets/facebook_login_button.dart';
import 'package:my_social_app/views/account/widgets/login_form.dart';
import 'package:my_social_app/views/account/widgets/google_login_button.dart';
import 'package:my_social_app/views/account/widgets/login_page_diveder.dart';

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

            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: GoogleLoginButton(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: FacebookLoginButton(),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(const ChangeActiveAccountPageAction(payload: ActiveAccountPage.registerPage));
                    },
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

