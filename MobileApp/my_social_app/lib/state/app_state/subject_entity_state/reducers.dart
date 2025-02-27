import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,SubjectState> nextSubjectQuestionsReducer(EntityState<num,SubjectState> prev,NextSubjectQuestionsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingNextQuestions());
EntityState<num,SubjectState> nextSubjectQuestionsSuccessReducer(EntityState<num,SubjectState> prev,NextSubjectQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addNextPageQuestions(action.questions));
EntityState<num,SubjectState> nextSubjectQuestionsFailedReducer(EntityState<num,SubjectState> prev,NextSubjectQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingNextQuestions()); 

EntityState<num,SubjectState> prevQuestionReducer(EntityState<num,SubjectState> prev,PrevSubjectQuestionsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingPrevQuestions());
EntityState<num,SubjectState> prevQuestionSuccessReducer(EntityState<num,SubjectState> prev,PrevSubjectQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addPrevQuestions(action.questionIds));
EntityState<num,SubjectState> prevQuestionsFailedReducer(EntityState<num,SubjectState> prev,PrevSubjectQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingPrevQuestions()) ;

EntityState<num,SubjectState> addSubjectReducer(EntityState<num,SubjectState> prev,AddSubjectAction action)
  => prev.appendOne(action.subject);
EntityState<num,SubjectState> addSubjectsReducer(EntityState<num,SubjectState> prev,AddSubjectsAction action)
  => prev.appendMany(action.subjects);

EntityState<num,SubjectState> nextTopicsReducer(EntityState<num,SubjectState> prev,NextSubjectTopicsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingNextTopics());
EntityState<num,SubjectState> nextTopicsSuccessReducer(EntityState<num,SubjectState> prev,NextSubjectTopicsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addNextTopics(action.topicIds)) ;
EntityState<num,SubjectState> nextTopicsFailedReducer(EntityState<num,SubjectState> prev,NextSubjectTopicsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingNextTopics());

Reducer<EntityState<num,SubjectState>> subjectEntityStateReducers = combineReducers<EntityState<num,SubjectState>>([
  TypedReducer<EntityState<num,SubjectState>,NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<EntityState<num,SubjectState>,NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,SubjectState>,NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,SubjectState>,PrevSubjectQuestionsAction>(prevQuestionReducer).call,
  TypedReducer<EntityState<num,SubjectState>,PrevSubjectQuestionsSuccessAction>(prevQuestionSuccessReducer).call,
  TypedReducer<EntityState<num,SubjectState>,PrevSubjectQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,SubjectState>,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<EntityState<num,SubjectState>,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<EntityState<num,SubjectState>,NextSubjectTopicsAction>(nextTopicsReducer).call,
  TypedReducer<EntityState<num,SubjectState>,NextSubjectTopicsSuccessAction>(nextTopicsSuccessReducer).call,
  TypedReducer<EntityState<num,SubjectState>,NextSubjectTopicsFailedAction>(nextTopicsFailedReducer).call,
]);