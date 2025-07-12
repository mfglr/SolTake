import 'package:flutter/widgets.dart';
import 'package:test_app/models/exam_state.dart';
import 'package:test_app/services/exam_service.dart';
import 'package:test_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class AppState {
  final Pagination<int,ExamState> exams;
  const AppState({required this.exams});
}

class AppStateNotifier extends ValueNotifier<AppState>{
  AppStateNotifier() : super(
    AppState(
      exams: Pagination<int, ExamState>.init(20, true, ExamService().getExams)
    )
  );

  static void next(Pagination pagination){
    if(!pagination.isReadyForNextPage) return;
    pagination = pagination.startLoadingNext();
    
  }
}