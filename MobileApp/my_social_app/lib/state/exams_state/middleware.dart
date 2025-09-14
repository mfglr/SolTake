import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/exams_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void nextExamsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextExamsAction){
    final pagination = store.state.exams;
    ExamService()
      .getExams(pagination.next)
      .then((exams) => store.dispatch(NextExamsSuccessAction(exams: exams.map((e) => e.toExamState()))))
      .catchError((e){
        store.dispatch(const NextExamsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshExamsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshExamsAction){
    final pagination = store.state.exams;
    ExamService()
      .getExams(pagination.first)
      .then((exams) => store.dispatch(RefreshExamsSuccessAction(exams: exams.map((e) => e.toExamState()))))
      .catchError((e){
        store.dispatch(const RefreshExamsFailedAction());
        throw e;
      });
  }
  next(action);
}