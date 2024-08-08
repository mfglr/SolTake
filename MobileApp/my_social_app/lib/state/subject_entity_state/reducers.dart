import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState getNextPageSubjectQuestionsReducer(SubjectEntityState prev,GetNextPageSubjectQuestionsAction action)
  => prev.getNextPageQuestions(action.subjectId);
SubjectEntityState addNextPageSubjectQuestionsReducer(SubjectEntityState prev,AddNextPageSubjectQuestionsAction action)
  => prev.addNextPageQuestions(action.subjectId,action.questions);

SubjectEntityState loadTopicsOfSelectSubjectSuccessReducer(SubjectEntityState prev,Action action)
  => action is LoadTopicsOfSelectedSubjectSuccessAction ? prev.loadTopics(action.subjectId, action.topicIds) : prev;

SubjectEntityState addSubjectsReducer(SubjectEntityState prev,Action action)
  => action is AddSubjectsAction ? prev.addSubjects(action.subjects) : prev;


Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,GetNextPageSubjectQuestionsAction>(getNextPageSubjectQuestionsReducer).call,
  TypedReducer<SubjectEntityState,AddNextPageSubjectQuestionsAction>(addNextPageSubjectQuestionsReducer).call,

  TypedReducer<SubjectEntityState,LoadTopicsOfSelectedSubjectSuccessAction>(loadTopicsOfSelectSubjectSuccessReducer).call,
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectsReducer).call,
]);