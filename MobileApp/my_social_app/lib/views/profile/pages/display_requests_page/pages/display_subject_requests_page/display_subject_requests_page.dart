import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_request_state/actions.dart';
import 'package:my_social_app/state/subject_request_state/subject_request_state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/display_subject_requests_page_constants.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/create_subject_button/create_subject_request_button.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/pages/display_subject_requests_page/widgets/subject_requests_widget/subject_requests_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';

class DisplaySubjectRequestsPage extends StatefulWidget {
  const DisplaySubjectRequestsPage({super.key});

  @override
  State<DisplaySubjectRequestsPage> createState() => _DisplaySubjectRequestsPageState();
}

class _DisplaySubjectRequestsPageState extends State<DisplaySubjectRequestsPage> {
  final _scrollController = ScrollController();
  
  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.subjectRequests, const NextSubjectRequestsAction());
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
        store.dispatch(const FirstSubjectRequestsAction());
        return store.onChange.map((e) => e.subjectRequests).firstWhere((e) => !e.loadingNext);
      },
      child: StoreConnector<AppState,Pagination<int, SubjectRequestState>>(
        onInit: (store) => getNextEntitiesIfNoPage(store, store.state.subjectRequests, const NextSubjectRequestsAction()),
        converter: (store) => store.state.subjectRequests,
        builder: (context, pagination) => SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0,bottom: 8),
                  child: const CreateSubjectRequestButton(),
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