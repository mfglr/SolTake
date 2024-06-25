import 'package:flutter/material.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/storage/storage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

enum MenuAction{
  logout
}

class _HomeViewState extends State<HomeView> {
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
                  final Storage storage = getIt<Storage>();
                  await storage.removeLoginResponse();
                  if(!context.mounted) return;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login/', (route) => false 
                  );
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