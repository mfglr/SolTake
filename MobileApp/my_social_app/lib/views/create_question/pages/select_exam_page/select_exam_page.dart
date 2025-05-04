import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/app_exams_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/create_question/widgets/exam_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'select_exam_page_texts.dart';

class SelectExamPage extends StatefulWidget {
  const SelectExamPage({super.key});
  @override
  State<SelectExamPage> createState() => _SelectExamPageState();
}

class _SelectExamPageState extends State<SelectExamPage> {
  final ScrollController _scrollController = ScrollController();
  late final void Function() _onScrollBottom;
  @override
  void initState() {
    _onScrollBottom = (){
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextPageIfReady(store,store.state.appExams,const NextExamsAction());
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
        title: LanguageWidget(
          child:(language) => AppTitle(
            title: title[language]!
          ),
        ),
      ),
      body: StoreConnector<AppState,Iterable<ExamState>>(
        onInit: (store) => getNextPageIfNoPage(store,store.state.appExams,const NextExamsAction()),
        converter: (store) => store.state.selectExams,
        builder:(context,exams) => StoreConnector<AppState,Pagination>(
          converter: (store) => store.state.appExams,
          builder: (context,pagination){
            if(pagination.loadingNext) return const LoadingWidget();
            return GridView.count(
              crossAxisCount: 2,
              children: List<Widget>.generate(
                exams.length,
                (index) => ExamItemWidget(
                  exam: exams.elementAt(index)
                )
              )
            );
          }
        )
      ),
    );
  }
}