import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items_widget.dart';

class SearchQuestionWidget extends StatefulWidget {
  final SearchState state;
  const SearchQuestionWidget({super.key,required this.state});
  @override
  State<SearchQuestionWidget> createState() => _SearchQuestionWidgetState();
}

class _SearchQuestionWidgetState extends State<SearchQuestionWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: StoreConnector<AppState,Iterable<ExamState>>(
                  onInit: (store) => store.dispatch(const GetAllExamsAction()),
                  converter: (store) => store.state.examEntityState.entities.values,
                  builder:(context,exams) => DropdownSearch<String>(
                    selectedItem: exams.where((x) => x.id == widget.state.examId).firstOrNull?.shortName,
                    items: exams.map((e) => e.shortName).toList(),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Exams"
                      ),
                    ),
                    onChanged: (value){
                      setState(() {
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        final examId = exams.firstWhere((exam) => exam.shortName == value).id;
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
                    if(widget.state.examId == null) return [];
                    return store.state.selectExamSubjects(widget.state.examId!);
                  },
                  builder: (context,subjects) => DropdownSearch<String>(
                    enabled: widget.state.examId != null,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Select Subjects"
                      ),
                    ),
                    selectedItem: subjects.where((subject) => subject.id == widget.state.subjectId).firstOrNull?.name,
                    items: subjects.map((e) => e.name).toList(),
                    onChanged: (value){
                      setState(() {
                        final subjectId = subjects.firstWhere((exam) => exam.name == value).id;
                        final store = StoreProvider.of<AppState>(context,listen: false);
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
              if(widget.state.subjectId == null) return [];
              return store.state.selectSubjectTopics(widget.state.subjectId!);
            },
            builder: (context,topics) => DropdownSearch<String>(
              enabled: widget.state.subjectId != null,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Select Topics"
                ),
              ),
              selectedItem: topics.where((x) => x.id == widget.state.topicId).firstOrNull?.name,
              items: topics.map((e) => e.name).toList(),
              onChanged: (value){
                setState(() {
                  final topicId = topics.firstWhere((exam) => exam.name == value).id;
                  final store = StoreProvider.of<AppState>(context,listen: false);
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
              pagination: widget.state.questions,
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(const GetNextPageSearchingQuestionsIfReadyAction());
              }
            ), 
          ),
        )
      ],
    );
  }
}