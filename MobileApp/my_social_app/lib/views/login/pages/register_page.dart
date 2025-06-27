import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/actions.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/login/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const RegisterForm(),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.register_login_label),
                  OutlinedButton(
                    onPressed: (){
                      final store = StoreProvider.of<AppState>(context,listen: false);
                      store.dispatch(const ChangeActiveLoginPage(loginPage: ActiveLoginPage.loginPage));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(AppLocalizations.of(context)!.register_login_button)
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
