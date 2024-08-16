import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState getNextPageSubjectQuestionsReducer(SubjectEntityState prev,GetNextPageSubjectQuestionsAction action)
  => prev.getNextPageQuestions(action.subjectId);
SubjectEntityState addNextPageSubjectQuestionsReducer(SubjectEntityState prev,AddNextPageSubjectQuestionsAction action)
  => prev.addNextPageQuestions(action.subjectId,action.questions);
SubjectEntityState addSubjectsReducer(SubjectEntityState prev,AddSubjectsAction action)
  => prev.addSubjects(action.subjects);

SubjectEntityState loadTopicsOfSelectSubjectSuccessReducer(SubjectEntityState prev,GetSubjectTopicsSuccessAction action)
  => prev.loadTopics(action.subjectId, action.topicIds);

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,GetNextPageSubjectQuestionsAction>(getNextPageSubjectQuestionsReducer).call,
  TypedReducer<SubjectEntityState,AddNextPageSubjectQuestionsAction>(addNextPageSubjectQuestionsReducer).call,
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectsReducer).call,

  TypedReducer<SubjectEntityState,GetSubjectTopicsSuccessAction>(loadTopicsOfSelectSubjectSuccessReducer).call,
]);