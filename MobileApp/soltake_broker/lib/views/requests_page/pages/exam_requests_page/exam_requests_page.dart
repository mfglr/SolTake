import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/helpers/on_scroll_bottom.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/actions.dart';
import 'package:soltake_broker/state/app_state/exam_request_state/exam_request_state.dart';
import 'package:soltake_broker/state/entity_state/action_dispathcers.dart';
import 'package:soltake_broker/state/entity_state/pagination.dart';
import 'package:soltake_broker/views/requests_page/pages/exam_requests_page/widgets/exam_requests_widget/exam_requests_widget.dart';
import 'package:soltake_broker/views/shared/loading_circle_widget.dart';

class ExamRequestsPage extends StatefulWidget {
  const ExamRequestsPage({super.key});

  @override
  State<ExamRequestsPage> createState() => _ExamRequestsPageState();
}

class _ExamRequestsPageState extends State<ExamRequestsPage> {
  final _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.examRequests, NextPendingExamRequestsAction());
    }
  );

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const FirstPendingExamRequestsAction());
        return store.onChange.map((state) => state.examRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int,ExamRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.examRequests,const NextPendingExamRequestsAction()),
        converter: (store) => store.state.examRequests,
        builder: (context, pagination) => SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height
                ),
                child: Builder(
                  builder: (context) {
                    if(pagination.isEmpty){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sınav oluşturma isteği yok!",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                    return ExamRequestsWidget(
                      examRequests: pagination.values
                    );
                  }
                ),
              ),
              if(pagination.loadingNext)
                const LoadingCircleWidget()
            ],
          ),
        )
      ),
    );
  }
}