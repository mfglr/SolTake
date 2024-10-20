import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/notification/widgets/no_notifications.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/notification/widgets/notification_items.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;

  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextEntitiesIfReady(
          store,
          store.state.notificationEntityState.pagination,
          const NextNotificationsAction()
        );
      }
    };
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: Text(
          AppLocalizations.of(context)!.notifications_page_title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StoreConnector<AppState,NotificationEntityState>(
        onInit: (store) => getNextEntitiesIfNoPage(
          store,
          store.state.notificationEntityState.pagination,
          const NextNotificationsAction()
        ),
        converter: (store) => store.state.notificationEntityState,
        builder: (context,state) => SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              if(state.pagination.isLast && state.pagination.entities.isEmpty)
                const NoNotifications()
              else
                NotificationItems(
                  notifications: state.notifications
                ),
              if(state.pagination.loadingNext)
                const LoadingCircleWidget(
                  strokeWidth: 3
                )
            ],
          ),
        )
      ),
    );
  }
}