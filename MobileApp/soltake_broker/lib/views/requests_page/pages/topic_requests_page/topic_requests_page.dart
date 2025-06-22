import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/on_scroll_bottom.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/actions.dart';
import 'package:soltake_broker/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:soltake_broker/state/entity_state/action_dispathcers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';
import 'package:soltake_broker/views/requests_page/pages/topic_requests_page/widgets/topic_requests_widget/topic_requests_widget.dart';
import 'package:soltake_broker/views/shared/loading_circle_widget.dart';

class TopicRequestsPage extends StatefulWidget {
  const TopicRequestsPage({super.key});

  @override
  State<TopicRequestsPage> createState() => _TopicRequestsPageState();
}

class _TopicRequestsPageState extends State<TopicRequestsPage> {
  final _scrollController = ScrollController();
  void _onScrolBotton() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.topicRequests, NextPendingTopicRequestsAction());
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrolBotton);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrolBotton);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(FirstPendingTopicRequestsAction());
        return store.onChange.map((e) => e.topicRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int,TopicRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.topicRequests, NextPendingTopicRequestsAction()),
        converter: (store) => store.state.topicRequests,
        builder: (context, pagination) => SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              children: [
                if(pagination.isEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: const Text(
                          "Konu oluşturma isteği yok",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                TopicRequestsWidget(
                  topicRequests: pagination.values
                ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}