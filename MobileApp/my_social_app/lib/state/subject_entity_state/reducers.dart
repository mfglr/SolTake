import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState addSubjectesReducer(SubjectEntityState prev,Action action)
  => action is AddSubjectsAction ? prev.addSubjects(action.subjects) : prev;

SubjectEntityState nextPageOfSubjectQuestionsReducer(SubjectEntityState prev,Action action)
  => action is NextPageOfSubjectQuestionsSuccessAction ? prev.nextPageOfQuestions(action.subjectId,action.questions) : prev;

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,AddSubjectsAction>(addSubjectesReducer).call,
  TypedReducer<SubjectEntityState,NextPageOfSubjectQuestionsSuccessAction>(nextPageOfSubjectQuestionsReducer).call,
]);