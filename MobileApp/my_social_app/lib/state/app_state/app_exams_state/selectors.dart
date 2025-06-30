import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, Id<int>> selectAppExamPagination(Store<AppState> store)
  => store.state.appExams;
Iterable<ExamState> selectAppExams(Store<AppState> store)
  => store.state.appExams.values.map((e) => store.state.examEntityState.getValue(e.id)!);