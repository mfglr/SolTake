import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,SubjectState> nextSubjectQuestionsReducer(EntityState<int,SubjectState> prev,NextSubjectQuestionsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingNextQuestions());
EntityState<int,SubjectState> nextSubjectQuestionsSuccessReducer(EntityState<int,SubjectState> prev,NextSubjectQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addNextPageQuestions(action.questions));
EntityState<int,SubjectState> nextSubjectQuestionsFailedReducer(EntityState<int,SubjectState> prev,NextSubjectQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingNextQuestions()); 

EntityState<int,SubjectState> prevQuestionReducer(EntityState<int,SubjectState> prev,PrevSubjectQuestionsAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.startLoadingPrevQuestions());
EntityState<int,SubjectState> prevQuestionSuccessReducer(EntityState<int,SubjectState> prev,PrevSubjectQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.addPrevQuestions(action.questionIds));
EntityState<int,SubjectState> prevQuestionsFailedReducer(EntityState<int,SubjectState> prev,PrevSubjectQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.subjectId)!.stopLoadingPrevQuestions()) ;

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
  TypedReducer<EntityState<int,SubjectState>,NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<EntityState<int,SubjectState>,PrevSubjectQuestionsAction>(prevQuestionReducer).call,
  TypedReducer<EntityState<int,SubjectState>,PrevSubjectQuestionsSuccessAction>(prevQuestionSuccessReducer).call,
  TypedReducer<EntityState<int,SubjectState>,PrevSubjectQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<EntityState<int,SubjectState>,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<EntityState<int,SubjectState>,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsAction>(nextTopicsReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsSuccessAction>(nextTopicsSuccessReducer).call,
  TypedReducer<EntityState<int,SubjectState>,NextSubjectTopicsFailedAction>(nextTopicsFailedReducer).call,
]);