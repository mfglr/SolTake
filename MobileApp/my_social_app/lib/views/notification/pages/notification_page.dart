import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/notifications_state.dart/actions.dart';
import 'package:my_social_app/state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/notification/widgets/no_notifications.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/views/notification/widgets/notification_items.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';

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
          store.state.notifications,
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
      body: StoreConnector<AppState,Pagination<num,NotificationState>>(
        onInit: (store) => getNextEntitiesIfNoPage(
          store,
          store.state.notifications,
          const NextNotificationsAction()
        ),
        converter: (store) => store.state.notifications,
        builder: (context,pagination) => SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              if(pagination.isLast && pagination.values.isEmpty)
                const NoNotifications()
              else
                NotificationItems(notifications: pagination.values),
              if(pagination.loadingNext)
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