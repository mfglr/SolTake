import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/subjects_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,SubjectState> selectExamSubjectsFromState(SubjectsState state, int examId) =>
  state.examSubjects[examId] ?? Pagination.init(subjectsPerPage, true);
Pagination<int,SubjectState> selectExamSubjects(Store<AppState> store, int examId) =>
  selectExamSubjectsFromState(store.state.subjects, examId);
Future<bool> onExamSubjectsLoaded(Store<AppState> store, int examId) =>
  store.onChange.map((state) => !selectExamSubjectsFromState(state.subjects, examId).loadingNext).first;