import 'package:flutter/material.dart';
import 'package:my_social_app/providers/profile_provider.dart';
import 'package:my_social_app/views/root/home_view.dart';
import 'package:my_social_app/views/loading_view.dart';
import 'package:my_social_app/views/root/profile/profile_page.dart';
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
            label: 'Home',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle),
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Profile',
          ),

        ],
      ),
      body: FutureBuilder(
        future: context.read<ProfileProvider>().init(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case(ConnectionState.done):
              return [
                const HomeView(),
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

