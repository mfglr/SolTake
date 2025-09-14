import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/search_page_state/search_page_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

SearchPageState selectSearchPageState(Store<AppState> store) => store.state.searchPageState;
ExamState? selectSearchPageExam(Store<AppState> store) => store.state.searchPageState.exam;