import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState nextSubjectQuestionsReducer(SubjectEntityState prev,NextSubjectQuestionsAction action)
  => prev.startLoadingNextQuestions(action.subjectId);
SubjectEntityState nextSubjectQuestionsSuccessReducer(SubjectEntityState prev,NextSubjectQuestionsSuccessAction action)
  => prev.addNextPageQuestions(action.subjectId,action.questions);
SubjectEntityState nextSubjectQuestionsFailedReducer(SubjectEntityState prev,NextSubjectQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions(action.subjectId);

SubjectEntityState prevQuestionReducer(SubjectEntityState prev,PrevSubjectQuestionsAction action)
  => prev.startLoadingPrevQuestions(action.subjectId);
SubjectEntityState prevQuestionSuccessReducer(SubjectEntityState prev,PrevSubjectQuestionsSuccessAction action)
  => prev.addPrevPageQuestions(action.subjectId,action.questionIds);
SubjectEntityState prevQuestionsFailedReducer(SubjectEntityState prev,PrevSubjectQuestionsFailedAction action)
  => prev.stopLoadingPrevQuestions(action.subjectId);

SubjectEntityState addSubjectReducer(SubjectEntityState prev,AddSubjectAction action)
  => prev.addSubject(action.subject);
SubjectEntityState addSubjectsReducer(SubjectEntityState prev,AddSubjectsAction action)
  => prev.addSubjects(action.subjects);

SubjectEntityState nextTopicsReducer(SubjectEntityState prev,NextSubjectTopicsAction action)
  => prev.startLoadingNextTopics(action.subjectId);
SubjectEntityState nextTopicsSuccessReducer(SubjectEntityState prev,NextSubjectTopicsSuccessAction action)
  => prev.addNextPageTopics(action.subjectId, action.topicIds);
SubjectEntityState nextTopicsFailedReducer(SubjectEntityState prev,NextSubjectTopicsFailedAction action)
  => prev.stopLoadingNextTopics(action.subjectId);

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,NextSubjectQuestionsAction>(nextSubjectQuestionsReducer).call,
  TypedReducer<SubjectEntityState,NextSubjectQuestionsSuccessAction>(nextSubjectQuestionsSuccessReducer).call,
  TypedReducer<SubjectEntityState,NextSubjectQuestionsFailedAction>(nextSubjectQuestionsFailedReducer).call,

  TypedReducer<SubjectEntityState,PrevSubjectQuestionsAction>(prevQuestionReducer).call,
  TypedReducer<SubjectEntityState,PrevSubjectQuestionsSuccessAction>(prevQuestionSuccessReducer).call,
  TypedReducer<SubjectEntityState,PrevSubjectQuestionsFailedAction>(prevQuestionsFailedReducer).call,

  TypedReducer<SubjectEntityState,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<SubjectEntityState,NextSubjectTopicsAction>(nextTopicsReducer).call,
  TypedReducer<SubjectEntityState,NextSubjectTopicsSuccessAction>(nextTopicsSuccessReducer).call,
  TypedReducer<SubjectEntityState,NextSubjectTopicsFailedAction>(nextTopicsFailedReducer).call,
]);