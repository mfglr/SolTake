import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/search_page_state/actions.dart';
import 'package:my_social_app/state/app_state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/app_state/search_page_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/actions.dart';
import 'package:my_social_app/state/app_state/subjects_state/selectors.dart';
import 'package:my_social_app/state/app_state/topics_state/actions.dart';
import 'package:my_social_app/state/app_state/topics_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/key_pagination.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page/display_search_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_abstract_items/question_abstract_items.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/exam_dropdown_search_widget/exam_dropdown_search_widget.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/subject_dropdown_search_widget/subject_dropdown_search_widget.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/topic_dropdown_search_widget/topic_dropdown_search_widget.dart';

class SearchQuestionsPage extends StatelessWidget {
  const SearchQuestionsPage({super.key});

   @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final pagination = selectSearchPageQuestionPagination(store);
        if(!pagination.loadingNext){
          store.dispatch(const RefreshSearchPageQuestionsAction());
        }
        return onSearchPageQuestionsLoaded(store);
      },
      child: StoreConnector<AppState,SearchPageState>(
        converter: (store) => selectSearchPageState(store),
        builder: (context, state) => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ExamDropdownSearchWidget(
                      selectedExam: state.exam,
                      onChanged: (exam){
                        final store = StoreProvider.of<AppState>(context, listen: false);
                        store.dispatch(ChangeExamAction(exam: exam));
                        if(exam == null) return;
                        getNextEntitiesIfNoPage(
                          store,
                          selectExamSubjects(store, exam.id),
                          NextExamSubjectsAction(examId: exam.id)
                        );
      
                        store.dispatch(const RefreshSearchPageQuestionsAction());
                      },
                    )
                  )
                ),
        
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: SubjectDropdownSearchWidget(
                      exam: state.exam,
                      selectedSubject: state.subject,
                      onChanged: (subject){
                        final store = StoreProvider.of<AppState>(context, listen: false);
                        store.dispatch(ChangeSubjectAction(subject: subject));
                        if(subject == null) return;
                        getNextEntitiesIfNoPage(
                          store,
                          selectSubjectTopics(store, subject.id),
                          NextSubjectTopicsAction(subjectId: subject.id)
                        );
      
                        store.dispatch(const RefreshSearchPageQuestionsAction());
                      },
                    ),
                  )
                )
              ],
            ),
            
            Container(
              margin: const EdgeInsets.all(5),
              child: TopicDropdownSearchWidget(
                subject: state.subject,
                selectedTopic: state.topic,
                onChanged: (topic){
                  final store = StoreProvider.of<AppState>(context, listen: false);
                  store.dispatch(ChangeTopicAction(topic: topic));

                  store.dispatch(const RefreshSearchPageQuestionsAction());
                }
              )
            ),
            Expanded(
              child: StoreConnector<AppState, (KeyPagination<int>, Iterable<QuestionState>)>(
                onInit: (store){
                  final pagination = selectSearchPageQuestionPagination(store);
                  if(pagination.noPage){
                    store.dispatch(const NextSearchPageQuestionsAction());
                  }
                },
                converter: (store) => selectSearchPagePaginationAndQuestions(store),
                builder: (context, data) => QuestionAbstractItems(
                  onTap: (questionId) => Navigator
                    .of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => DisplaySearchQuestionsPage(
                          firstDisplayedQuestionId: questionId,
                        )
                      )
                    ),
                  data: data,
                  onScrollBottom: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    final pagination = selectSearchPageQuestionPagination(store);
                    if(pagination.isReadyForNextPage){
                      store.dispatch(const NextSearchPageQuestionsAction());
                    }
                  }
                ),
              ),
            )
          
          ],
        ),
      ),
    );
  }
}