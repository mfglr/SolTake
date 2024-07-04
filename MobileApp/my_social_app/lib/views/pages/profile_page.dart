import 'package:flutter/material.dart';
import 'package:my_social_app/providers/user_provider.dart';
import 'package:my_social_app/views/shared/user/user_info_header_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final state = context.select((UserProvider u) => u.getCurrentUser()!);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(state.formatUserName()),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5,0,5,5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserInfoHeaderWidget(state: state),
            OutlinedButton(
              onPressed: (){},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Text("Edit your profile")
                  ),
                  const Icon(Icons.edit)
                ],
              )
            )
          ],
        )
      )
    );
  }
}