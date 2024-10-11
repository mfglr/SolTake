import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadExamMiddleare(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadExamAction){
    if(store.state.examEntityState.entities[action.examId] == null){
      ExamService()
        .getExamById(action.examId)
        .then((exam) => store.dispatch(AddExamAction(exam: exam.toExamState())));
    }
  }
  next(action);
}

void nextExamQeuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextExamQuestionsAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.questions;
    QuestionService()
      .getByExamId(action.examId,pagination.next)
      .then((questions){
        store.dispatch(NextExamQuestionsSuccessAction(examId: action.examId,questionIds: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      })
      .catchError((e){
        store.dispatch(NextExamQuestionsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
void prevExamQuestionsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevExamQuestionsAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.questions;
    QuestionService()
      .getByExamId(action.examId, pagination.prev)
      .then((questions){
        store.dispatch(PrevExamQuestionsSuccessAction(examId: action.examId,questionIds: questions.map((x) => x.id)));
        store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
        store.dispatch(AddUserImagesAction(images: questions.map((e) => UserImageState.init(e.appUserId))));
        store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
        store.dispatch(AddTopicsListAction(lists: questions.map((e) => e.topics.map((e) => e.toTopicState()))));
      })
      .catchError((e){
        store.dispatch(PrevExamQuestionsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}

void nextExamSubjectsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextExamSubjectsAction){
    final pagination = store.state.examEntityState.entities[action.examId]!.subjects;
    SubjectService()
      .getByExamId(action.examId,pagination.next)
      .then((subjects){
        store.dispatch(AddSubjectsAction(subjects: subjects.map((e) => e.toSubjectState())));
        store.dispatch(NextExamSubjectsSuccessAction(examId: action.examId,subjectIds: subjects.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextExamSubjectsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
