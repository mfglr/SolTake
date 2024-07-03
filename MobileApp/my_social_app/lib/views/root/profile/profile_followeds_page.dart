import 'package:flutter/material.dart';
import 'package:my_social_app/providers/profile_provider.dart';
import 'package:my_social_app/views/shared/User/user_items_widget.dart';
import 'package:provider/provider.dart';

class ProfileFollowedsPage extends StatelessWidget {
  const ProfileFollowedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final followers = context.select((ProfileProvider p) => p.followeds);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followings"),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: UserItemsWidget(state: followers)
      )
    );
  }
}