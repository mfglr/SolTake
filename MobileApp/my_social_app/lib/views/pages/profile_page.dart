import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      converter: (store) => store.state.currentUser,
      builder: (context,currentUser){
        if(currentUser != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(currentUser.formatUserName(10)),
            ),
            body: Container(
              padding: const EdgeInsets.fromLTRB(5,0,5,5),
              child: UserInfoCardWidget(state: currentUser)
            )
          );
        }
        return const LoadingView();
      },
    );
  }
}