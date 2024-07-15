import 'package:my_social_app/services/topic_service.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void loadTopicsMiddelware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadTopicsAction){
    final subjectId = store.state.createQuestionState.subjectId!;
    if(!store.state.topicEntityState.isLoaded(subjectId)){
      TopicService()
        .getBySubjectId(subjectId)
        .then(
          (topics) => store.dispatch(
            LoadTopicsSuccessAction(subjectId: subjectId, payload: topics.map((e) => e.toTopicState()).toList())
          )
        );
    }
  }
  next(action);
}