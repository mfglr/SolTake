import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomeViewState();
}

enum MenuAction{
  logout
}

class _HomeViewState extends State<HomePage> {
  final AccountProvider _stateManager = AccountProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch(value){
                case MenuAction.logout:
                  bool logOut = await DialogCreator.showLogOutDialog(context);
                  if(logOut){
                    await _stateManager.logOut();
                    if(!context.mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
                  }
                default:
                  return;
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Logout"),
                      Icon(Icons.logout)
                    ],
                  )
                )
              ];
            }
          ),
        ],
      ),
    );
  }
}