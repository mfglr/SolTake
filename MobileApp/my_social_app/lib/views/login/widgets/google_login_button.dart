import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:my_social_app/state/state.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const LoginByGoogleAction());
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