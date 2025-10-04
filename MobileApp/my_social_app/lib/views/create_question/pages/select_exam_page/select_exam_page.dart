import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/exams_state/actions.dart';
import 'package:my_social_app/state/exams_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page/widgets/create_exam_button/create_exam_button.dart';
import 'package:my_social_app/views/create_question/pages/select_exam_page/widgets/exam_item_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_back_button_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/loading_circle_widget.dart';
import 'select_exam_page_texts.dart';

class SelectExamPage extends StatefulWidget {
  const SelectExamPage({super.key});
  @override
  State<SelectExamPage> createState() => _SelectExamPageState();
}

class _SelectExamPageState extends State<SelectExamPage> {
  final ScrollController _scrollController = ScrollController();
  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextPageIfReady(store,selectExams(store),const NextExamsAction());
      }
    );
  Future<bool> _onRefresh(){
    final store = StoreProvider.of<AppState>(context, listen: false);
    refreshEntities(store, selectExams(store), const RefreshExamsAction());
    return onExamsLoaded(store);
  }

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
      onRefresh: _onRefresh,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child:(language) => AppTitle(
              title: title[language]!
            ),
          ),
          actions: const [
            CreateExamButton()
          ],
        ),
        body: StoreConnector<AppState,Pagination<int,ExamState>>(
          onInit: (store) => getNextPageIfNoPage(store, selectExams(store), const NextExamsAction()),
          converter: (store) => selectExams(store),
          builder:(context,pagination) => Column(
            children: [
              Expanded(
                child: GridView.count(
                  controller: _scrollController,
                  crossAxisCount: 2,
                  children: List<Widget>.generate(
                    pagination.values.length,
                    (index) => ExamItemWidget(
                      exam: pagination.values.elementAt(index)
                    )
                  )
                ),
              ),
              if(pagination.loadingNext)
                const LoadingCircleWidget()
            ],
          )
        ),
      ),
    );
  }
}