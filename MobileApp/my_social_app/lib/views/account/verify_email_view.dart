import 'package:flutter/material.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late final TextEditingController _token;
  final AccountService _service = AccountService();

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
              child: Text(
                AppLocalizations.of(context)!.verify_email_label,
                textAlign: TextAlign.center,
              )
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                controller: _token,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: AppLocalizations.of(context)!.verify_email_code
                ),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
              child: OutlinedButton(
                onPressed: () {
                  store.dispatch(ConfirmEmailByTokenAction(token: _token.text));
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(AppLocalizations.of(context)!.verify_email_button)
                    ),
                    const Icon(Icons.verified)
                  ],
                )
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8) ,
              child: Text(AppLocalizations.of(context)!.verify_email_send_mail_label),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
              child: OutlinedButton(
                onPressed: () async {
                  await _service.updateEmailConfirmationToken();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(AppLocalizations.of(context)!.verify_email_send_mail_button)
                    ),
                    const Icon(Icons.email)
                  ],
                )
              ),
            ),

            Column(
              children: [
                Text(AppLocalizations.of(context)!.verify_email_login_label),
                OutlinedButton(
                  onPressed: () {
                    store.dispatch(const LogOutAction());
                    store.dispatch(const ChangeActiveLoginPageAction(payload: ActiveLoginPage.loginPage));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(AppLocalizations.of(context)!.verify_email_login_button)
                      ),
                      const Icon(Icons.login)
                    ]
                  )
                ),
                Text(AppLocalizations.of(context)!.verify_email_register_label),
                OutlinedButton(
                  onPressed: () {
                    store.dispatch(const LogOutAction());
                    store.dispatch(const ChangeActiveLoginPageAction(payload: ActiveLoginPage.registerPage));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(AppLocalizations.of(context)!.verify_email_register_button)
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
