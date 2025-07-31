import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';
import 'package:my_social_app/state/app_state/exams_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/search_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/actions.dart';
import 'package:my_social_app/state/app_state/subjects_state/selectors.dart';
import 'package:my_social_app/state/app_state/topics_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/selectors.dart';
import 'package:my_social_app/state/app_state/topics_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page/display_search_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstracts_item_widget/question_abstract_items_widget.dart';

class SearchQuestionWidget extends StatefulWidget {
  const SearchQuestionWidget({super.key});

  @override
  State<SearchQuestionWidget> createState() => _SearchQuestionWidgetState();
}

class _SearchQuestionWidgetState extends State<SearchQuestionWidget> {
  int? _examId;
  int? _subjectId;
  int? _topicId;

  @override
  Widget build(BuildContext context) {
    return Text("");
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             margin: const EdgeInsets.all(5),
    //             child: StoreConnector<AppState,Iterable<ExamState>>(
    //               onInit: (store) => getNextPageIfNoPage(store,selectExams(store),const NextExamsAction()),
    //               converter: (store) => store.state.examEntityState.values,
    //               builder:(context,exams) => DropdownSearch<String>(
    //                 selectedItem: exams.where((x) => x.id == _examId).firstOrNull?.initialism,
    //                 items: exams.map((e) => e.initialism).toList(),
    //                 dropdownDecoratorProps: DropDownDecoratorProps(
    //                   dropdownSearchDecoration: InputDecoration(
    //                     labelText: AppLocalizations.of(context)!.search_question_widget_select_exam
    //                   ),
    //                 ),
    //                 onChanged: (value){
    //                   final store = StoreProvider.of<AppState>(context,listen: false);
    //                   final exam = exams.firstWhere((exam) => exam.initialism == value);
    //                   if(exam.id == _examId) return;
                      
    //                   setState((){
    //                     _examId = exam.id;
    //                     _subjectId = null;
    //                     _topicId = null;
    //                   });
                      
    //                   getNextPageIfNoPage(store, selectExamSubjects(store, exam.id), NextExamSubjectsAction(examId: exam.id));
    //                   store.dispatch(FirstSearchQuestionsAction(examId: _examId, subjectId: _subjectId, topicId: _topicId));
    //                 },
    //               ),
    //             ),
    //           )
    //         ),
    //         Expanded(
    //           child: Container(
    //             margin: const EdgeInsets.all(5),
    //             child: StoreConnector<AppState,Iterable<SubjectState>>(
    //               converter: (store) => _examId != null ? selectExamSubjects(store, _examId!).values : [],
    //               builder: (context,subjects) => DropdownSearch<String>(
    //                 enabled: subjects.isNotEmpty,
    //                 dropdownDecoratorProps: DropDownDecoratorProps(
    //                   dropdownSearchDecoration: InputDecoration(
    //                     labelText: AppLocalizations.of(context)!.search_question_widget_select_subject
    //                   ),
    //                 ),
    //                 selectedItem: subjects.where((subject) => subject.id == _subjectId).firstOrNull?.name,
    //                 items: subjects.map((e) => e.name).toList(),
    //                 onChanged: (value){
    //                   final subject = subjects.firstWhere((subject) => subject.name == value);
    //                   final store = StoreProvider.of<AppState>(context,listen: false);
    //                   if(subject.id == _subjectId) return;

    //                   setState((){
    //                     _subjectId = subject.id;
    //                     _topicId = null;
    //                   });
    //                   getNextPageIfNoPage(store, subject.topics, NextSubjectTopicsAction(subjectId: subject.id));
    //                   store.dispatch(FirstSearchQuestionsAction(examId: _examId, subjectId: _subjectId, topicId: _topicId));
    //                 },
    //               ),
    //             ),
    //           )
    //         )
    //       ],
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(5),
    //       child: StoreConnector<AppState,Pagination<int,TopicState>>(
    //         converter: (store) => selectSubjectTopics(store, _subjectId),
    //         builder: (context,topics) => DropdownSearch<String>(
    //           enabled: topics.isNotEmpty,
    //           dropdownDecoratorProps: DropDownDecoratorProps(
    //             dropdownSearchDecoration: InputDecoration(
    //               labelText: AppLocalizations.of(context)!.search_question_widget_select_topic
    //             ),
    //           ),
    //           selectedItem: topics.where((x) => x.id == _topicId).firstOrNull?.name,
    //           items: topics.map((e) => e.name).toList(),
    //           onChanged: (value){
    //             final topicId = topics.firstWhere((exam) => exam.name == value).id;
    //             final store = StoreProvider.of<AppState>(context,listen: false);
    //             if(topicId == _topicId) return;

    //             setState(() => _topicId = topicId);
    //             store.dispatch(FirstSearchQuestionsAction(examId: _examId,subjectId: _subjectId, topicId: _topicId));
    //           },
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: StoreConnector<AppState,Pagination<int, QuestionState>>(
    //         onInit: (store) => getNextPageIfNoPage(
    //           store,
    //           store.state.searchQuestions,
    //           NextSearchQuestionsAction(examId: _examId, subjectId: _subjectId, topicId: _topicId)
    //         ),
    //         converter: (store) => selectSearchPageQuestion(store),
    //         builder: (context, pagination) => QuestionAbstractItemsWidget(
    //           onTap: (questionId) => Navigator
    //             .of(context)
    //             .push(
    //               MaterialPageRoute(
    //                 builder: (context) => DisplaySearchQuestionsPage(
    //                   firstDisplayedQuestionId: questionId,
    //                   examId: _examId,
    //                   subjectId: _subjectId,
    //                   topicId: _topicId,
    //                 )
    //               )
    //             ),
    //           pagination: pagination,
    //           onScrollBottom: (){
    //             final store = StoreProvider.of<AppState>(context,listen: false);
    //             getNextPageIfReady(
    //               store,
    //               store.state.searchQuestions,
    //               NextSearchQuestionsAction(examId: _examId, subjectId: _subjectId, topicId: _topicId)
    //             );
    //           }
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}