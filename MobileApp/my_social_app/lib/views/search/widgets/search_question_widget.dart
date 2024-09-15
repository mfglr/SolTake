import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/search_state/actions.dart';
import 'package:my_social_app/state/app_state/search_state/search_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchQuestionWidget extends StatefulWidget {
  const SearchQuestionWidget({super.key});
  @override
  State<SearchQuestionWidget> createState() => _SearchQuestionWidgetState();
}

class _SearchQuestionWidgetState extends State<SearchQuestionWidget> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,SearchState>(
      converter: (store) => store.state.searchState,
      builder:(context,state) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: StoreConnector<AppState,Iterable<ExamState>>(
                    onInit: (store) => store.dispatch(const GetNextPageExamsIfNoPageAction()),
                    converter: (store) => store.state.examEntityState.entities.values,
                    builder:(context,exams) => DropdownSearch<String>(
                      selectedItem: exams.where((x) => x.id == state.examId).firstOrNull?.shortName,
                      items: exams.map((e) => e.shortName).toList(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.search_question_widget_select_exam
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          final store = StoreProvider.of<AppState>(context,listen: false);
                          final examId = exams.firstWhere((exam) => exam.shortName == value).id;
                          if(examId == store.state.searchState.examId) return;

                          store.dispatch(ChangeSearchExamIdAction(examId: examId));
                          store.dispatch(GetExamSubjectsAction(examId: examId));
                          store.dispatch(const GetFirstPageSearchingQuestionsAction());
                        });
                      },
                    ),
                  ),
                )
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: StoreConnector<AppState,Iterable<SubjectState>>(
                    converter: (store){
                      if(state.examId == null) return [];
                      return store.state.selectExamSubjects(state.examId!);
                    },
                    builder: (context,subjects) => DropdownSearch<String>(
                      enabled: state.examId != null,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.search_question_widget_select_subject
                        ),
                      ),
                      selectedItem: subjects.where((subject) => subject.id == state.subjectId).firstOrNull?.name,
                      items: subjects.map((e) => e.name).toList(),
                      onChanged: (value){
                        setState(() {
                          final subjectId = subjects.firstWhere((exam) => exam.name == value).id;
                          final store = StoreProvider.of<AppState>(context,listen: false);
                          if(subjectId == store.state.searchState.subjectId) return;

                          store.dispatch(ChangeSearchSubjectIdAction(subjectId: subjectId));
                          store.dispatch(GetSubjectTopicsAction(subjectId: subjectId));
                          store.dispatch(const GetFirstPageSearchingQuestionsAction());
                        });
                      },
                    ),
                  ),
                )
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: StoreConnector<AppState,Iterable<TopicState>>(
              converter: (store){
                if(state.subjectId == null) return [];
                return store.state.selectSubjectTopics(state.subjectId!);
              },
              builder: (context,topics) => DropdownSearch<String>(
                enabled: state.subjectId != null,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.search_question_widget_select_topic
                  ),
                ),
                selectedItem: topics.where((x) => x.id == state.topicId).firstOrNull?.name,
                items: topics.map((e) => e.name).toList(),
                onChanged: (value){
                  setState(() {
                    final topicId = topics.firstWhere((exam) => exam.name == value).id;
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    if(topicId == store.state.searchState.topicId) return;
                    
                    store.dispatch(ChangeSearchTopicIdAction(topicId: topicId));
                    store.dispatch(const GetFirstPageSearchingQuestionsAction());
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: StoreConnector<AppState,Iterable<QuestionState>>(
              onInit: (store) => store.dispatch(const GetFirstPageSearhingQuestionsIfNoPageAction()),
              converter: (store) => store.state.selectSearchQuestions,
              builder: (context,questions) => QuestionAbstractItemsWidget(
                questions: questions,
                onTap: (questionId){
                  Navigator
                    .of(context)
                    .push(
                      MaterialPageRoute(builder: (context) => DisplaySearchQuestionsPage(
                        firstDisplayedQuestionId: questionId
                      ))
                    );
                },
                pagination: state.questions,
                onScrollBottom: (){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(const GetNextPageSearchingQuestionsIfReadyAction());
                }
              ), 
            ),
          )
        ],
      ),
    );
  }
}