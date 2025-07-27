import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/actions.dart';
import 'package:my_social_app/state/app_state/subjects_state/selectors.dart';
import 'package:redux/redux.dart';

void nextExamSubjectsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextExamSubjectsAction){
    final pagination = selectExamSubjects(store, action.examId);
    SubjectService()
      .getByExamId(action.examId, pagination.next)
      .then((subjects) => store.dispatch(NextExamSubjectsSuccessAction(
        examId: action.examId,
        subjects: subjects.map((e) => e.toSubjectState()))
      ))
      .catchError((e){
        store.dispatch(NextExamSubjectsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}
void refreshExamSubjectsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshExamSubjectsAction){
    final pagination = selectExamSubjects(store, action.examId);
    SubjectService()
      .getByExamId(action.examId, pagination.first)
      .then((subjects) => store.dispatch(RefreshExamSubjectsSuccessAction(
        examId: action.examId,
        subjects: subjects.map((e) => e.toSubjectState()))
      ))
      .catchError((e){
        store.dispatch(RefreshExamSubjectsFailedAction(examId: action.examId));
        throw e;
      });
  }
  next(action);
}