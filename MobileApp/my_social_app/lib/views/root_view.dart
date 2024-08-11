import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/connect_message_hub.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/icon_with_badge.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/home_page.dart';
import 'package:my_social_app/views/message/pages/message_home_page.dart';
import 'package:my_social_app/views/search_page.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState?>(
      onInit: (store) => connectMessageHub(store),
      converter: (store) => store.state.accountState,
      builder: (context,accountState){
        if(accountState != null){
          return StoreConnector<AppState,UserState?>(
            onInit: (store) => store.dispatch(LoadUserAction(userId: accountState.id)),
            converter: (store) => store.state.userEntityState.entities[accountState.id],
            builder: (context,userState){
              if(userState != null){
                return Scaffold(
                  bottomNavigationBar: NavigationBar(
                    onDestinationSelected: (index) => {
                      setState(() {
                        currentPageIndex = index;
                      })
                    },
                    selectedIndex: currentPageIndex,
                    destinations: [
                      const NavigationDestination(
                        selectedIcon: Icon(Icons.home),
                        icon: Icon(Icons.home_outlined),
                        label: '',
                      ),
                      
                      const NavigationDestination(
                        selectedIcon: Icon(Icons.search),
                        icon: Icon(Icons.search_outlined),
                        label: '',
                      ),
                
                      StoreConnector<AppState,int>(
                        converter: (store) => store.state.selectNumberOfComingMessages,
                        builder: (context,count) => NavigationDestination(
                          selectedIcon: IconWithBadge(
                            badgeCount: count,
                            icon: Icons.message,
                          ),
                          icon: IconWithBadge(
                            badgeCount: count,
                            icon: Icons.message_outlined,
                          ),
                          label: ''
                        ),
                      ),
                
                      NavigationDestination(
                        selectedIcon: UserImageWidget(
                          userId: accountState.id,
                          diameter: 30
                        ),
                        icon: UserImageWidget(
                          userId: accountState.id,
                          diameter: 30
                        ),
                        label: '',
                      ),
                    ],
                  ),
                  body: [
                    const HomePage(),
                    const SearchPage(),
                    const MessageHomePage(),
                    UserPage(userId: userState.id,userName: null,)
                  ][currentPageIndex]
                );
              }
              return const LoadingView();
            }
          );
        }
        return const LoadingView();
      }
    );
  }
}

