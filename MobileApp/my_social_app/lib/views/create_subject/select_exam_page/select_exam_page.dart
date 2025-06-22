import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/create_subject/select_exam_page/widgets/exams_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'select_exam_page_constants.dart';

class SelectExamPage extends StatefulWidget {
  const SelectExamPage({
    super.key,
  });

  @override
  State<SelectExamPage> createState() => _SelectExamPageState();
}

class _SelectExamPageState extends State<SelectExamPage> {
  Pagination<int,ExamState> _exams = Pagination.init(examsPerPage, true);
  
  final _scrollController = ScrollController();
  
  String _key = '';
  final _subject = BehaviorSubject<String>();
  late final StreamSubscription<String> _subscription;

  void _onScrollBottom() => onScrollBottom(_scrollController,() => _nextPage(_key));

  @override
  void initState() {
    _searchExam('');

    _subscription = _subject
      .debounceTime(const Duration(milliseconds: 500))
      .distinct()
      .listen(_searchExam);

    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  void _searchExam(String key){
    if(!_exams.loadingNext){
      setState(() => _exams = _exams.startLoadingNext());
      ExamService()
        .search(key, _exams.first)
        .then((exams) => setState(() => _exams = _exams.addfirstPage(exams.map((e) => e.toExamState()))))
        .catchError((e){
          setState(() => _exams = _exams.stopLoadingNext());
          throw e;
        });
    }
  }

  void _nextPage(String key){
    if(_exams.isReadyForNextPage){
      setState(() => _exams = _exams.startLoadingNext());
      ExamService()
        .search(key, _exams.next)
        .then((exams) => setState(() => _exams = _exams.addNextPage(exams.map((e) => e.toExamState()))))
        .catchError((e){
          setState(() => _exams = _exams.stopLoadingNext());
          throw e;
        });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: LanguageWidget(
          child: (language) => AppTitle(
            title: title[language]!
          )
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LanguageWidget(
              child: (language) => TextField(
                onChanged: (value){
                  _key = value;
                  _subject.add(value);
                },
                decoration: InputDecoration(
                  hintText: labelText[language]!
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height
                ),
                child: Column(
                  children: [
                    if(_exams.isEmpty)
                      LanguageWidget(
                        child: (langauge) => Text(
                          notFoundExams[langauge]!
                        ),
                      ),
                    ExamsWidget(
                      exams: _exams.values,
                    ),
                    if(_exams.loadingNext)
                      const LoadingCircleWidget()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}