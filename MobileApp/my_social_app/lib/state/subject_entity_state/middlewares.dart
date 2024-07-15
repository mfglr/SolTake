import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadSubjectsMiddelware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSubjectsAction){
    final examId = store.state.createQuestionState.examId!;
    if(!store.state.subjectEntityState.isLoaded(examId)){
      SubjectService()
        .getByExamId(examId)
        .then(
          (subjects) => store.dispatch(
            LoadSubjectsSuccessAction(examId: examId, payload: subjects.map((e) => e.toSubjectState()).toList())
          )
        );
    }
  }
  next(action);
}