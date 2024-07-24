import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/home_page_state/actions.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/shared/question/question_items_widget.dart';

enum MenuAction{
  logout
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return StoreConnector<AppState,AccountState?>(
      converter: (store) => store.state.accountState,
      builder: (context, accountState){ 
        return Scaffold(
          appBar: AppBar(
            title: const Text("E-Class"),
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
              Navigator.of(context).pushNamed(takeQuestionImageRoute);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.question_mark),
          ),
          body: StoreConnector<AppState,Iterable<QuestionState>>(
            onInit: (store) => store.dispatch(const NextPageOfHomeQuestionsAction()),
            converter: (store) => store.state.getHomePageQuestions,
            builder:(context,questions) => QuestionItemsWidget(questions: questions),
          ),
        );
      } 
      
    );
  }
}