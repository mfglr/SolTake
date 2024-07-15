import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';

ExamEntityState loadExamsReducer(ExamEntityState oldState,Action action)
  => action is LoadExamSuccessAction ? oldState.loadExams(action.payload) : oldState;