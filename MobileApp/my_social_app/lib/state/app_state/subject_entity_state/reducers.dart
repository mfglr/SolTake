import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState getNextPageSubjectQuestionsReducer(SubjectEntityState prev,GetNextPageSubjectQuestionsAction action)
  => prev.getNextPageQuestions(action.subjectId);
SubjectEntityState addNextPageSubjectQuestionsReducer(SubjectEntityState prev,AddNextPageSubjectQuestionsAction action)
  => prev.addNextPageQuestions(action.subjectId,action.questions);

SubjectEntityState getPrevPageQuestionReducer(SubjectEntityState prev,GetPrevPageSubjectQuestionsAction action)
  => prev.getPrevPageQuestions(action.subjectId);
SubjectEntityState addPrevPageQuestionReducer(SubjectEntityState prev,AddPrevPageSubjectQuestionsAction action)
  => prev.addPrevPageQuestions(action.subjectId,action.questionIds);

SubjectEntityState addSubjectReducer(SubjectEntityState prev,AddSubjectAction action)
  => prev.addSubject(action.subject);
SubjectEntityState addSubjectsReducer(SubjectEntityState prev,AddSubjectsAction action)
  => prev.addSubjects(action.subjects);

SubjectEntityState loadTopicsOfSelectSubjectSuccessReducer(SubjectEntityState prev,GetSubjectTopicsSuccessAction action)
  => prev.loadTopics(action.subjectId, action.topicIds);

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,GetNextPageSubjectQuestionsAction>(getNextPageSubjectQuestionsReducer).call,
  TypedReducer<SubjectEntityState,AddNextPageSubjectQuestionsAction>(addNextPageSubjectQuestionsReducer).call,

  TypedReducer<SubjectEntityState,GetPrevPageSubjectQuestionsAction>(getPrevPageQuestionReducer).call,
  TypedReducer<SubjectEntityState,AddPrevPageSubjectQuestionsAction>(addPrevPageQuestionReducer).call,

  TypedReducer<SubjectEntityState,AddSubjectAction>(addSubjectReducer).call,
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<SubjectEntityState,GetSubjectTopicsSuccessAction>(loadTopicsOfSelectSubjectSuccessReducer).call,
]);