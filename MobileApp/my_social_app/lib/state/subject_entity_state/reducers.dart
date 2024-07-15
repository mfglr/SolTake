import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';

SubjectEntityState loadSubjectsReducer(SubjectEntityState oldState,Action action)
  => action is LoadSubjectsSuccessAction ? oldState.load(action.examId, action.payload) : oldState;