import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/search_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:redux/redux.dart';

void firstSearchQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstSearchQuestionsAction){
    QuestionService()
      .searchQuestions(action.examId, action.subjectId, action.topicId, Page.init(questionsPerPage, true))
      .then((questions){
        store.dispatch(FirstSearchQuestionsSuccessAction(ids: questions.map((e) => Id(id: e.id))));
        
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const FirstSearchQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void nextSearchQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSearchQuestionsAction){
    QuestionService()
      .searchQuestions(action.examId, action.subjectId, action.topicId, store.state.searchQuestions.next)
      .then((questions){
        store.dispatch(NextSearchQuestionsSuccessAction(ids: questions.map((e) => Id(id: e.id))));
        
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const NextSearchQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}