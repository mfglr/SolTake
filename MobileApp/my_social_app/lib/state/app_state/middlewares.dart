import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void nextExamsMidleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextExamsAction){
    ExamService()
      .getExams(store.state.exams.next)
      .then((exams){
        store.dispatch(AddExamsAction(exams: exams.map((e) => e.toExamState())));
        store.dispatch(NextExamsSuccessAction(examIds: exams.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(const NextExamsFailedAction());
        throw e;
      });
  }
  next(action);
}

