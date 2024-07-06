import 'package:flutter/material.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppProvider u) => u.getUser(AccountProvider().state!.id)!);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(state.formatUserName(10)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5,0,5,5),
        child: UserInfoCardWidget(state: state)
      )
    );
  }
}