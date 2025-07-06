import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadExamMiddleare(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadExamAction){
    if(store.state.examEntityState.getValue(action.examId) == null){
      ExamService()
        .getExamById(action.examId)
        .then((exam) => store.dispatch(AddExamAction(exam: exam.toExamState())));
    }
  }
  next(action);
}

void nextExamSubjectsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextExamSubjectsAction){
    final pagination = store.state.examEntityState.getValue(action.examId)!.subjects;
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
