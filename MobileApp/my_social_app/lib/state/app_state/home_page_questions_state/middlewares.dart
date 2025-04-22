import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/home_page_questions_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:redux/redux.dart';

void nextHomeQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextHomeQuestionsAction){
    final pagination = store.state.homePageQuestions;
    QuestionService()
      .getHomePageQuestions(pagination.next)
      .then((questions){
        store.dispatch(NextHomeQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const NextHomeQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void prevHomeQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevHomeQuestionsAction){
    final pagination = store.state.homePageQuestions;
    QuestionService()
      .getHomePageQuestions(pagination.prev)
      .then((questions){
        store.dispatch(PrevHomeQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const PrevHomeQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstHomeQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstHomeQuestionsAction){
    QuestionService()
      .getHomePageQuestions(Page<int>.init(questionsPerPage, true))
      .then((questions){
        store.dispatch(FirstHomeQuestionsSuccessAction(questionIds: questions.map((e) => e.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const FirstHomeQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
