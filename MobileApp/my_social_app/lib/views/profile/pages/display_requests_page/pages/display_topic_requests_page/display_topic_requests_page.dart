import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_requests_state/topic_request_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/create_question/pages/select_topic_page/widgets/create_topic_request_button/create_topic_request_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_topic_requests_page/widgets/topic_requests_widget/topic_requests_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'display_topic_requests_page_constants.dart';

class DisplayTopicRequestsPage extends StatefulWidget {
  const DisplayTopicRequestsPage({super.key});

  @override
  State<DisplayTopicRequestsPage> createState() => _DisplayTopicRequestsPageState();
}

class _DisplayTopicRequestsPageState extends State<DisplayTopicRequestsPage> {
  final _scrollController = ScrollController();
  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.topicRequests, const NextTopicRequestsAction());
    }
  );

  @override
  void initState() {
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
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const FirstTopicRequestsAction());
        return store.onChange.map((state) => state.topicRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState, Pagination<int,TopicRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.topicRequests, const NextTopicRequestsAction()),
        converter: (store) => store.state.topicRequests,
        builder: (context,pagination) => SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8,bottom: 8),
                  child: const CreateTopicRequestButton(),
                ),
                if(pagination.isEmpty)
                  LanguageWidget(
                    child: (language) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,top: 45),
                          child: Text(
                            content[language]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
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