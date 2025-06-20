import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/create_exam_request_button/create_exam_request_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_exam_requests_page/widgets/exam_requests_widget/exam_requests_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

import 'display_exam_requests_page_constants.dart';

class DisplayExamRequestsPage extends StatefulWidget {
  const DisplayExamRequestsPage({super.key});

  @override
  State<DisplayExamRequestsPage> createState() => _DisplayExamRequestsPageState();
}

class _DisplayExamRequestsPageState extends State<DisplayExamRequestsPage> {
  final _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.examRequests, const NextExamRequestsAction());
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const FirstExamRequestsAction());
        return store.onChange.map((state) => state.examRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int, ExamRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.examRequests, const NextExamRequestsAction()),
        converter: (store) => store.state.examRequests,
        builder: (context, pagination) => 
          SingleChildScrollView(
            controller: _controller,
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const CreateExamRequestButton()
                  ),
                  Builder(
                    builder: (context) {
                      if(pagination.isEmpty){
                        return LanguageWidget(
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
                        );
                      }
                      return ExamRequestsWidget(
                        examRequests: pagination.values
                      );
                    }
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