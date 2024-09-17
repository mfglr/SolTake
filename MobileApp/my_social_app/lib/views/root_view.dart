import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/connect_message_hub.dart';
import 'package:my_social_app/connect_notification_hub.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/icon_with_badge.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/home_page.dart';
import 'package:my_social_app/views/message/pages/message_home_page/message_home_page.dart';
import 'package:my_social_app/views/search/pages/search_page.dart';
import 'package:my_social_app/views/profile/pages/profile_page/profile_page.dart';
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
    final store = StoreProvider.of<AppState>(context,listen: false);
    connectNotificationHub(store);
    connectMessageHub(store);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store){
        store.dispatch(LoadUserAction(userId: store.state.accountState!.id));
      },
      converter: (store) => store.state.userEntityState.entities[store.state.accountState!.id],
      builder: (context,user){
        if(user != null){
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
                    userId: user.id,
                    diameter: 30
                  ),
                  icon: UserImageWidget(
                    userId: user.id,
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
              const ProfilePage()
            ][currentPageIndex]
          );
        }
        return const LoadingView();
      }
    );
  }
}

