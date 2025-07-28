import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SubjectState> addSubjectReducer(EntityState<int,SubjectState> prev,AddSubjectAction action)
  => prev.appendOne(action.subject);
EntityState<int,SubjectState> addSubjectsReducer(EntityState<int,SubjectState> prev,AddSubjectsAction action)
  => prev.appendMany(action.subjects);

Reducer<EntityState<int,SubjectState>> subjectEntityStateReducers = combineReducers<EntityState<int,SubjectState>>([
  TypedReducer<EntityState<int,SubjectState>,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<EntityState<int,SubjectState>,AddSubjectsAction>(addSubjectsReducer).call,
]);