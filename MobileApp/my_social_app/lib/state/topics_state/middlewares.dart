import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topics_state/actions.dart';
import 'package:my_social_app/state/topics_state/selectors.dart';
import 'package:redux/redux.dart';

void nextSubjectTopicsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSubjectTopicsAction){
    final pagination = selectSubjectTopics(store, action.subjectId);
    TopicService()
      .getBySubjectId(action.subjectId, pagination.next)
      .then((topics) => store.dispatch(NextSubjectTopicsSuccessAction(
        subjectId: action.subjectId,
        topics: topics.map((e) => e.toTopicState())
      )))
      .catchError((e){
        store.dispatch(NextSubjectTopicFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
void refreshSubjectTopicsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSubjectTopicsAction){
    final pagination = selectSubjectTopics(store, action.subjectId);
    TopicService()
      .getBySubjectId(action.subjectId, pagination.first)
      .then((topics) => store.dispatch(RefreshSubjectTopicsSuccessAction(
        subjectId: action.subjectId,
        topics: topics.map((e) => e.toTopicState())
      )))
      .catchError((e){
        store.dispatch(RefreshSubjectTopicFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}