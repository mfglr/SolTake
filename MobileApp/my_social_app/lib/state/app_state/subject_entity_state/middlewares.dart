import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadSubjectMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSubjectAction){
    if(store.state.subjectEntityState.getValue(action.subjectId) == null){
      SubjectService()
        .getSubjectById(action.subjectId)
        .then((subject) => store.dispatch(AddSubjectAction(subject: subject.toSubjectState())));
    }
  }
  next(action);
}

