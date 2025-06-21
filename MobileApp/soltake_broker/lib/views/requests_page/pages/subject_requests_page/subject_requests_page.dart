import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/on_scroll_bottom.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/subject_request_state/subject_request_state.dart';
import 'package:soltake_broker/state/entity_state/action_dispathcers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';
import 'package:soltake_broker/views/requests_page/pages/subject_requests_page/widgets/subject_requests_widget/subject_requests_widget.dart';
import 'package:soltake_broker/views/shared/loading_circle_widget.dart';

class SubjectRequestsPage extends StatefulWidget {
  const SubjectRequestsPage({super.key});

  @override
  State<SubjectRequestsPage> createState() => _SubjectRequestsPageState();
}

class _SubjectRequestsPageState extends State<SubjectRequestsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.subjectRequests, NextPendingSubjectRequestsAction());
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
        store.dispatch(const FirstPendingSubjectRequestsAction());
        return store.onChange.map((state) => state.subjectRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int,SubjectRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.subjectRequests, NextPendingSubjectRequestsAction()),
        converter: (store) => store.state.subjectRequests,
        builder: (context, pagination) => SingleChildScrollView(
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
                          "Ders olusturma isteği yok",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                SubjectRequestsWidget(
                  subjectRequests: pagination.values
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