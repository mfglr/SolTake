import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/views/create_topic/select_subject_page/select_subject_page_constants.dart';
import 'package:my_social_app/views/create_topic/select_subject_page/widgets/subjects_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'package:rxdart/rxdart.dart';

class SelectSubjectPage extends StatefulWidget {
  const SelectSubjectPage({super.key});

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _search("");
    _streamSubscription = 
      _subject
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen(_search);
    _scrollController.addListener(_nextPage);
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _scrollController.dispose();
    super.dispose();
  }


  String? _key;
  final _subject = BehaviorSubject<String>();
  late final StreamSubscription<String> _streamSubscription;
  Pagination<int, SubjectState> _pagination = Pagination.init(subjectsPerPage, true);
  void _search(String key){
    if(!_pagination.loadingNext){
      setState(() => _pagination = _pagination.startLoadingNext());
      SubjectService
        .search(key, _pagination.first)
        .then((subjects) => setState(() => _pagination = _pagination.refreshPage(subjects.map((e) => e.toSubjectState()))))
        .catchError((e){
          setState(() => _pagination = _pagination.stopLoadingNext());
          throw e;
        });
    }
  }
  void _nextPage(){
    if(_pagination.isReadyForNextPage){
      setState(() => _pagination = _pagination.startLoadingNext());
      SubjectService
        .search(_key, _pagination.next)
        .then((subjects) => setState(() => _pagination = _pagination.addNextPage(subjects.map((e) => e.toSubjectState()))))
        .catchError((e){
          setState(() => _pagination = _pagination.stopLoadingNext());
          throw e;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: LanguageWidget(
                child: (language) => TextField(
                  onChanged: (value){
                    _subject.add(value);
                    _key = value;
                  },
                  decoration: InputDecoration(
                    hintText: hintText[language]
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    if(_pagination.isEmpty)
                      LanguageWidget(
                        child: (language) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              noSubjects[language]!
                            )
                          ],
                        )
                      )
                    else
                      SubjectsWidget(
                        subjects: _pagination.values
                      ),
                    if(_pagination.loadingNext)
                      const LoadingCircleWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}