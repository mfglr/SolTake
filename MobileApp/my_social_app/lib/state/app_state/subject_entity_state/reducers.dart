import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SubjectState> addSubjectReducer(EntityState<int,SubjectState> prev,AddSubjectAction action)
  => prev.appendOne(action.subject);
EntityState<int,SubjectState> addSubjectsReducer(EntityState<int,SubjectState> prev,AddSubjectsAction action)
  => prev.appendMany(action.subjects);

EntityState<int,SubjectState> nextTopicsReducer(EntityState<int,SubjectState> prev,NextSubjectTopicsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingNextTopics());
EntityState<int,SubjectState> nextTopicsSuccessReducer(EntityState<int,SubjectState> prev,NextSubjectTopicsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addNextTopics(action.topicIds)) ;
EntityState<int,SubjectState> nextTopicsFailedReducer(EntityState<int,SubjectState> prev,NextSubjectTopicsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingNextTopics());

Reducer<EntityState<int,SubjectState>> subjectEntityStateReducers = combineReducers<EntityState<int,SubjectState>>([
  TypedReducer<EntityState<int,SubjectState>,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<EntityState<int,SubjectState>,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsAction>(nextTopicsReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsSuccessAction>(nextTopicsSuccessReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsFailedAction>(nextTopicsFailedReducer).call,
]);