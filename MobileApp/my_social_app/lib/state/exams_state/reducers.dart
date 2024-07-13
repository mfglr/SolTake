import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/exams_state/actions.dart';
import 'package:my_social_app/state/exams_state/exams_state.dart';

ExamsState loadExams(ExamsState oldState,Action action)
  => action is LoadExamSuccessAction ? oldState.loadExams(action.payload) : oldState;