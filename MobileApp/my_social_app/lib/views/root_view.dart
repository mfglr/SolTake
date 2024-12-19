import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/notifications/app_notifications.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/notification_hub.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_multimedia_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/account/pages/application_loading_page.dart';
import 'package:my_social_app/views/shared/multimedia_slider/multimedia_slider.dart';
import 'package:my_social_app/views/shared/icon_with_badge.dart';
import 'package:my_social_app/views/home_page.dart';
import 'package:my_social_app/views/message/pages/message_home_page/message_home_page.dart';
import 'package:my_social_app/views/search/pages/search_page.dart';
import 'package:my_social_app/views/profile/pages/profile_page/profile_page.dart';
import 'package:my_social_app/views/shared/video_page_slider/video_page_slider.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

const medias = [
  QuestionMultimediaState(
    id: 5,
    questionId: 4,
    containerName: "QuestionMedias",
    blobName: "2e8ccb2d-8fe4-4ba7-b592-5e39f1f7ded4_638702046356509754",
    size: 69408127,
    height: 854,
    width: 480,
    duration: 61.3,
    multimediaType: MultimediaType.video,
    status: MultimediaStatus.done,
    data: null
  ),
  QuestionMultimediaState(
    id: 8,
    questionId: 5,
    containerName: "QuestionMedias",
    blobName: "f2aed341-000d-4f54-a5a1-5d3479495d54_638702048741818583",
    size: 28308,
    height: 1600,
    width: 1200,
    duration: 0,
    multimediaType: MultimediaType.image,
    status: MultimediaStatus.done,
    data: null
  ),
  QuestionMultimediaState(
    id: 5,
    questionId: 4,
    containerName: "QuestionMedias",
    blobName: "2e8ccb2d-8fe4-4ba7-b592-5e39f1f7ded4_638702046356509754",
    size: 69408127,
    height: 854,
    width: 480,
    duration: 61.3,
    multimediaType: MultimediaType.video,
    status: MultimediaStatus.done,
    data: null
  ),
];



class RootView extends StatefulWidget {
  const RootView({super.key});
  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentPageIndex = 0;
  late StreamSubscription<String?> _accessTokenConsumer;

  @override
  void initState() {
    initNotifications(context);

    final store = StoreProvider.of<AppState>(context,listen: false);

    _accessTokenConsumer = store.onChange
      .map((state) => state.accessToken)
      .distinct()
      .listen((token){
        if(token != null){
          MessageHub.init(store);
          if(mounted){
            NotificationHub.init(context);
          }
        }
        else{
          MessageHub.close();
          NotificationHub.close();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _accessTokenConsumer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const VideoPageSlider(videos: medias)
    );
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: store.state.accountState!.id)),
      converter: (store) => store.state.userEntityState.entities[store.state.accountState!.id],
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
    );
  }
}

