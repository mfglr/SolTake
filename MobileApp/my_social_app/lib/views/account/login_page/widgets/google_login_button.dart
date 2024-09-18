import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        googleSignIn
          .signIn()
          .then((value){
            if(value == null) throw AppLocalizations.of(context)!.google_login_button_error;
            final store = StoreProvider.of<AppState>(context,listen: false);
            value.authentication
              .then((e){
                if(e.accessToken == null) throw AppLocalizations.of(context)!.google_login_button_error;
                store.dispatch(LoginByGoogleAction(accessToken: e.accessToken!));
              });
          });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("Google")
          ),
          Image.asset(
            "assets/images/google.png",
            height: 16,
            width: 16,
          )
        ],
      )
    );
  }
}