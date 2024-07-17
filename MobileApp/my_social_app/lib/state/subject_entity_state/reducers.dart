import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/subject_entity_state/subject_entity_state.dart';
import 'package:redux/redux.dart';

SubjectEntityState loadSubjectsByExamIdSuccessReducer(SubjectEntityState prev,Action action)
  => action is LoadSubjectsByExamIdSuccessAction ? prev.loadByExamId(action.examId, action.payload) : prev;

SubjectEntityState addSubjectesSuccessReducer(SubjectEntityState prev,Action action)
  => action is LoadSubjectsSuccessAction ? prev.addSubjects(action.subjects) : prev;

SubjectEntityState nextPageOfSubjectQuestionsReducer(SubjectEntityState prev,Action action)
  => action is NextPageOfSubjectQuestionsSuccessAction ? prev.nextPageOfQuestions(action.subjectId,action.questions) : prev;

Reducer<SubjectEntityState> subjectEntityStateReducers = combineReducers<SubjectEntityState>([
  TypedReducer<SubjectEntityState,LoadSubjectsByExamIdSuccessAction>(loadSubjectsByExamIdSuccessReducer).call,
  TypedReducer<SubjectEntityState,LoadSubjectsSuccessAction>(addSubjectesSuccessReducer).call,
  TypedReducer<SubjectEntityState,NextPageOfSubjectQuestionsSuccessAction>(nextPageOfSubjectQuestionsReducer).call,
]);