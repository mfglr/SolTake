import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/pages/home_page.dart';
import 'package:my_social_app/views/pages/search_page.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState?>(
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
                    destinations: const [
                      NavigationDestination(
                        selectedIcon: Icon(Icons.home),
                        icon: Icon(Icons.home_outlined),
                        label: '',
                      ),
                      
                      NavigationDestination(
                        selectedIcon: Icon(Icons.search),
                        icon: Icon(Icons.search_outlined),
                        label: '',
                      ),
                
                      NavigationDestination(
                        selectedIcon: Icon(Icons.person),
                        icon: Icon(Icons.person_outline),
                        label: '',
                      ),
                
                    ],
                  ),
                  body: [
                    const HomePage(),
                    const SearchPage(),
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

