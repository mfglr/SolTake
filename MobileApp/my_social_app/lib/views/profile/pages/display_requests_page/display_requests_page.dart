import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_requests_state/exam_request_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/widgets/exam_requests_widget/exam_requests_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/label_pagination_widget/label_pagination_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'display_requestes_page_constants.dart';

class DisplayRequestsPage extends StatefulWidget {
  const DisplayRequestsPage({super.key});
  @override
  State<DisplayRequestsPage> createState() => _DisplayRequestsPageState();
}

class _DisplayRequestsPageState extends State<DisplayRequestsPage> {
  double _page = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(_onPageChange);
    _examRequestsScrollController.addListener(_onExamRequestsScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    _pageController.dispose();

    _examRequestsScrollController.removeListener(_onExamRequestsScrollBottom);
    _examRequestsScrollController.dispose();
    super.dispose();
  }

  void _onPageChange() => setState(() { _page = _pageController.page ?? 0; });


  final ScrollController _examRequestsScrollController = ScrollController();
  void _onExamRequestsScrollBottom() => onScrollBottom(
    _examRequestsScrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, store.state.examRequests, const NextExamRequestsAction());
    }
  );

  Widget _getExamRequests() =>
    StoreConnector<AppState,Pagination<int, ExamRequestState>>(
      onInit: (store) => getNextEntitiesIfNoPage(store, store.state.examRequests, const NextExamRequestsAction()),
      converter: (store) => store.state.examRequests,
      builder: (context, pagination) => 
        SingleChildScrollView(
          controller: _examRequestsScrollController,
          child: Column(
            children: [
              ExamRequestsWidget(
                examRequests: pagination.values
              ),
              if(pagination.loadingNext)
                const LoadingCircleWidget()
            ],
          ),
        ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          ),
        ),
      ),
      body: Column(
        children: [
          LabelPaginationWidget(
            labelCount: icons.length,
            labelBuilder: (isActive,index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons[index],
                color: isActive ? Colors.black : Colors.grey,
                size: 16,
              ),
              LanguageWidget(
                child: (language) => Text(
                  getLabels(language).elementAt(index),
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.grey,
                    fontSize: 9
                    ),
                ),
              ),
            ],
          ),
              page: _page,
              width: MediaQuery.of(context).size.width,
              initialPage: 0,
              pageController: _pageController
            ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _getExamRequests(),
                Text("test"),
                Text("test")
              ]
            ),
          )
        ],
      ),
    );
  }
}