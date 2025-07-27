import 'package:my_social_app/services/exam_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
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
