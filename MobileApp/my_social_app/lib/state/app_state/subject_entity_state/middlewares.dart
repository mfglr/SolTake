import 'package:my_social_app/services/subject_service.dart';
import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
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
void nextSubjectTopicsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSubjectTopicsAction){
    final pagination = store.state.subjectEntityState.getValue(action.subjectId)!.topics;
    TopicService()
      .getBySubjectId(action.subjectId,pagination.next)
      .then((topics){
        store.dispatch(AddTopicsAction(topics: topics.map((e) => e.toTopicState())));
        store.dispatch(NextSubjectTopicsSuccessAction(subjectId: action.subjectId,topicIds: topics.map((e) => e.id)));
      })
      .catchError((e){
        store.dispatch(NextSubjectTopicsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
