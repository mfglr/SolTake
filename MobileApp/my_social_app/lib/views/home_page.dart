import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/create_question_state/actions.dart';
import 'package:my_social_app/state/app_state/home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:my_social_app/views/notification/pages/notification_page.dart';
import 'package:my_social_app/views/question/widgets/question_items_widget.dart';
import 'package:badges/badges.dart' as badges;

enum MenuAction{
  logout
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,NotificationEntityState>(
      onInit: (store) => store.dispatch(const LoadUnviewedNotificationsAction()),
      converter: (store) => store.state.notificationEntityState,
      builder: (context,state) => Scaffold(
        appBar: AppBar(
          title: const Text("E-CLASS"),
          actions: [
            IconButton(
              onPressed: (){
                store.dispatch(const MarkNotificationsAsViewedAction());
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationPage()));
              },
              icon: badges.Badge(
                badgeContent: state.numberOfUnviewedNotifications > 0 ? Text(
                  state.numberOfUnviewedNotifications.toString(),
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                ) : null,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: state.numberOfUnviewedNotifications > 0 ? Colors.red : Colors.transparent,
                ),
                child: const Icon(Icons.notifications),
              ),
            ),
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
            final store = StoreProvider.of<AppState>(context,listen: false);
            store.dispatch(const ClearCreateQuestionStateAction());
            Navigator.of(context).pushNamed(selectExamRoute);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.question_mark),
        ),
        
        body: StoreConnector<AppState,Iterable<QuestionState>>(
          onInit: (store) => store.dispatch(const GetNextPageHomeQuestionsIfNoPageAction()),
          converter: (store) => store.state.selectHomePageQuestions,
          builder:(context,questions) => StoreConnector<AppState,Pagination>(
            converter: (store) => store.state.homePageState.questions,
            builder: (context,pagination) => RefreshIndicator(
              onRefresh: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(const GetPrevPageHomePageQuestionsIfReadyAction());
                return store.onChange.map((state) => state.homePageState.questions).firstWhere((x) => !x.loadingPrev);
              },
              child: QuestionItemsWidget(
                questions: questions,
                pagination: pagination,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(const GetNextPageHomeQuestionsIfReadyAction());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}