import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState loadTopicsOfSelectSubjectSuccessReducer(SubjectEntityState prev,Action action)
  => action is LoadTopicsOfSelectedSubjectSuccessAction ? prev.loadTopics(action.subjectId, action.topicIds) : prev;

SubjectEntityState addSubjectsReducer(SubjectEntityState prev,Action action)
  => action is AddSubjectsAction ? prev.addSubjects(action.subjects) : prev;

SubjectEntityState nextPageOfSubjectQuestionsReducer(SubjectEntityState prev,Action action)
  => action is NextPageOfSubjectQuestionsSuccessAction ? prev.nextPageOfQuestions(action.subjectId,action.questions) : prev;

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,LoadTopicsOfSelectedSubjectSuccessAction>(loadTopicsOfSelectSubjectSuccessReducer).call,
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectsReducer).call,
  TypedReducer<SubjectEntityState,NextPageOfSubjectQuestionsSuccessAction>(nextPageOfSubjectQuestionsReducer).call,
]);