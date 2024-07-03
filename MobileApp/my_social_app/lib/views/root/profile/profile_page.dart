import 'package:flutter/material.dart';
import 'package:my_social_app/providers/profile_provider.dart';
import 'package:my_social_app/views/shared/User/user_info_card_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final userName = context.select((ProfileProvider p) => p.userName);
    final state = context.select((ProfileProvider p) => p.user);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: UserInfoCardWidget(state: state,)
      )
    );
  }
}