import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const ChangeActiveLoginPageAction(activeLoginPage: ActiveLoginPage.appLodingPage));
        store.dispatch(const LoginByFaceBookAction());
      },
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