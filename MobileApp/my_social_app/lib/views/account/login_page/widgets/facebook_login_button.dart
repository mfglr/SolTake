import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => 
        FacebookAuth.instance
          .login()
          .then((value){
            FacebookAuth.instance.accessToken
              .then((value){
                if(value == null) throw AppLocalizations.of(context)!.face_book_login_button_error;
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(LoginByFaceBookAction(accessToken: value.tokenString));
              });
          }),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 8, 102, 255)) 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text(
              "FaceBook",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ),
          const Icon(
            Icons.facebook_outlined,
            color: Colors.white,
          )
        ]
      )
    );
  }
}