import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/login/pages/application_loading_page.dart';
import 'package:my_social_app/views/display_video_questions/display_video_questions.dart';
import 'package:my_social_app/views/home_page/home_page.dart';
import 'package:my_social_app/views/message/pages/message_home_page/message_home_page.dart';
import 'package:my_social_app/views/search/pages/search_page/search_page.dart';
import 'package:my_social_app/views/profile/pages/profile_page/profile_page.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/profile_image_widget.dart';
import 'package:badges/badges.dart' as badges;

class RootView extends StatefulWidget {
  const RootView({super.key});
  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.loginState!.id)),
      converter: (store) => store.state.currentUser,
      builder: (context,user){
        if(user == null) return const ApplicationLoadingPage();
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) => setState(() { currentPageIndex = index;}),
            selectedIndex: currentPageIndex,
            destinations: [
              const NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: '',
              ),

              const NavigationDestination(
                selectedIcon: Icon(Icons.video_library),
                icon: Icon(Icons.video_library_outlined),
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
                  selectedIcon: badges.Badge(
                    showBadge: count > 0,
                    badgeContent: Text(count.toString()),
                    child: const Icon(Icons.message),
                  ),
                  icon: badges.Badge(
                    showBadge: count > 0,
                    badgeContent: Text(count.toString()),
                    child: const Icon(Icons.message_outlined),
                  ),
                  label: ''
                ),
              ),
        
              NavigationDestination(
                selectedIcon: ProfileImageWidget(
                  user: user,
                  diameter: 30
                ),
                icon: ProfileImageWidget(
                  user: user,
                  diameter: 30
                ),
                label: '',
              ),
            ],
          ),
          body: [
            const HomePage(),
            const DisplayVideoQuestions(),
            const SearchPage(),
            const MessageHomePage(),
            const ProfilePage()
          ][currentPageIndex]
        );
      }
    );
  }
}

