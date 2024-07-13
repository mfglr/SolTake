import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState?>(
      converter: (store) => store.state.accountState,
      builder:(context,accountState){
        store.dispatch(LoadUserAction(userId: accountState!.id));
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
                        store.dispatch(const LogOutAction());
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
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(store.state.createQuestionState.images.isNotEmpty){
                Navigator.of(context).pushNamed(displayImagesRoute);
              }
              else{
                Navigator.of(context).pushNamed(takePictureRoute);
              }
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.question_mark),
          ),
        );
      } 
      
    );
  }
}