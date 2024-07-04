import 'package:flutter/material.dart';
import 'package:my_social_app/providers/user_provider.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final userId = ModalRoute.of(context)!.settings.arguments as String;
    context.read<UserProvider>().loadUserById(userId);
    final user = context.select((UserProvider u) => u.getUser(userId));
    
    return Builder(
      builder: (context) {
        if(user != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(user.formatUserName(10)),
            ),
            body: Container(
              padding: const EdgeInsets.all(5),
              child: UserInfoCardWidget(state: user)
            )
          );
        }
        return const LoadingView();
      }
    );
  }
}