import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/subjects_state/actions.dart';
import 'package:my_social_app/state/subjects_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/create_question/pages/select_subject_page/widgets/create_subject_button/create_subject_button.dart';
import 'package:my_social_app/views/create_question/widgets/subject_item_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'select_subject_page_texts.dart';

class SelectSubjectPage extends StatefulWidget {
  final ExamState exam;
  const SelectSubjectPage({
    super.key,
    required this.exam
  });

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    super.dispose();
  }

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(
        store,
        selectExamSubjects(store, widget.exam.id),
        NextExamSubjectsAction(examId: widget.exam.id)
      );
    }
  );

  Future<bool> _onRefresh(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    refreshEntities(store, selectExamSubjects(store, widget.exam.id), RefreshExamSubjectsAction(examId: widget.exam.id));
    return onExamSubjectsLoaded(store, widget.exam.id);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child: (language) => AppTitle(
              title: title[language]!
            ),
          ),
          actions: [
            CreateSubjectButton(exam: widget.exam,)
          ],
        ),
        body: StoreConnector<AppState, Pagination<int, SubjectState>>(
          onInit: (store) => 
            getNextPageIfNoPage(
              store,
              selectExamSubjects(store, widget.exam.id),
              NextExamSubjectsAction(examId: widget.exam.id)
            ),
          converter: (store) => selectExamSubjects(store, widget.exam.id),
          builder:(context, pagination) => Column(
            children: [
              Expanded(
                child: GridView.count(
                  controller: _scrollController,
                  crossAxisCount: 2,
                  children: pagination
                    .values
                    .map((e) => SubjectItemWidget(subject: e))
                    .toList()
                ),
              ),
              if(pagination.loadingNext)
                const LoadingWidget()
            ],
          )
        ),
      ),
    );
  }
}