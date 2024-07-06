import 'package:flutter/material.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/shared/user/user_info_card_widget.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final userId = ModalRoute.of(context)!.settings.arguments as String;
    context.read<AppProvider>().loadUser(userId);

    return Selector<AppProvider, UserState?>(
      selector: (_, userProvider) => userProvider.getUser(userId),
      builder: (_, data, __){
        if(data != null){
          return Scaffold(
            appBar: AppBar(
              title: Text(data.formatUserName(10)),
            ),
            body: Container(
              padding: const EdgeInsets.all(5),
              child: UserInfoCardWidget(state: data)
            )
          );
        }
        return const LoadingView();
      }
    );
  }
}