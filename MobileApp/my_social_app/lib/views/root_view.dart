import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import 'package:my_social_app/state/state.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AccountState?>(
      converter: (store) => store.state.accountState,
      builder:(context,value){
        if(value != null){
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
              UserPage(userId: value.id)
            ][currentPageIndex]
          );
        }
        return const LoadingView();
      }
    );
  }
}

