import 'package:flutter/material.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/views/pages/home_page.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/pages/profile_page.dart';
import 'package:my_social_app/views/pages/search_page.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: context.read<AppProvider>().loadUser(AccountProvider().state!.id),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case(ConnectionState.done):
              return [
                const HomePage(),
                const SearchPage(),
                const ProfilePage()
              ][currentPageIndex];
            default:
              return const LoadingView();
          }
        },
      ) 
    );
  }
}

