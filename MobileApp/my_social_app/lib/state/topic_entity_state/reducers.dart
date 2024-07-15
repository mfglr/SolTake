import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/actions.dart';
import 'package:my_social_app/state/topic_entity_state/topic_entity_state.dart';

TopicEntityState loadTopicsReducer(TopicEntityState oldState,Action action)
  => action is LoadTopicsSuccessAction ? oldState.load(action.subjectId, action.payload) : oldState;