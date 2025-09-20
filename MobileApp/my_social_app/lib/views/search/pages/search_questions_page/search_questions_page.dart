import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/questions_state/actions.dart';
import 'package:my_social_app/state/questions_state/selectors.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/search_page_state/actions.dart';
import 'package:my_social_app/state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/search_page_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subjects_state/actions.dart';
import 'package:my_social_app/state/subjects_state/selectors.dart';
import 'package:my_social_app/state/topics_state/actions.dart';
import 'package:my_social_app/state/topics_state/selectors.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/container_pagination.dart';
import 'package:my_social_app/views/question/pages/display_search_questions_page/display_search_questions_page.dart';
import 'package:my_social_app/views/question/widgets/question_container_abstract/question_container_abstracts_widget.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/exam_dropdown_search_widget/exam_dropdown_search_widget.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/subject_dropdown_search_widget/subject_dropdown_search_widget.dart';
import 'package:my_social_app/views/search/pages/search_questions_page/widgets/topic_dropdown_search_widget/topic_dropdown_search_widget.dart';

class SearchQuestionsPage extends StatefulWidget {
  const SearchQuestionsPage({super.key});

  @override
  State<SearchQuestionsPage> createState() => _SearchQuestionsPageState();
}

class _SearchQuestionsPageState extends State<SearchQuestionsPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => 
    onScrollBottom(
      _scrollController,
      (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectSearchPageQuestions(store),
          const NextSearchPageQuestionsAction()
        );
      }
    );
  
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
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        refreshEntities(
          store,
          selectSearchPageQuestions(store),
          const RefreshSearchPageQuestionsAction()
        );
        return onSearchPageQuestionsLoaded(store);
      },
      child: SingleChildScrollView(
        controller: _scrollController,
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
              StoreConnector<AppState, ContainerPagination<int, QuestionState<int>>>(
                onInit: (store) => 
                  getNextEntitiesIfNoPage(
                    store,
                    selectSearchPageQuestions(store),
                    const NextSearchPageQuestionsAction()
                  ),
                converter: (store) => selectSearchPageQuestions(store),
                builder: (context, pagination) => QuestionContainerAbstractsWidget(
                  containers: pagination.containers,
                  numberOfColumn: 2,
                  onTap: (container) => Navigator
                    .of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => DisplaySearchQuestionsPage(
                          firstDisplayedQuestionId: container.key,
                        )
                      )
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}