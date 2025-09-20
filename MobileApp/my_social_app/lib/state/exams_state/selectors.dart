import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,ExamState> selectExams(Store<AppState> store) => store.state.exams;
Future<bool> onExamsLoaded(Store<AppState> store) =>
  store.onChange.map((state) => !state.exams.loadingNext).first;