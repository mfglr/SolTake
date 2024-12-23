import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

class UploadingSolutionsState {
  final Iterable<UploadingSolutionState> solutions;
  const UploadingSolutionsState({required this.solutions});

  UploadingSolutionsState addVideoSolution(String id, int questionId, String? content, XFile video)
    => UploadingSolutionsState(
        solutions: 
          solutions.any((e) => e.id == id)
          ? solutions
          : [
              ...solutions,
              UploadingSolutionState(
                id: id,
                questionId: questionId,
                content: content,
                medias: const Iterable.empty(),// check this row
                video: video,
                rate: 0,
                status: UploadingFileStatus.loading,
              )
            ]
      );
  
  UploadingSolutionsState addSolution(String id, int questionId,String? content,Iterable<AppFile> medias)
    => 
      UploadingSolutionsState(
        solutions: 
          solutions.any((e) => e.id == id)
          ? solutions 
          : [
              ...solutions,
              UploadingSolutionState(
                id:id,
                questionId: questionId,
                content: content,
                medias: medias,
                video: null,
                rate: 0,
                status: UploadingFileStatus.loading,
              )
            ]
      );

  UploadingSolutionsState changeRate(UploadingSolutionState state,double rate)
    => UploadingSolutionsState(
        solutions: [
          ...solutions.takeWhile((e) => e != state),
          state.changeRate(rate),
          ...solutions.toList().reversed.takeWhile((e) => e != state).toList().reversed
        ]
      );

  UploadingSolutionsState changeStatus(UploadingSolutionState state,UploadingFileStatus status)
    => UploadingSolutionsState(
        solutions: [
          ...solutions.takeWhile((e) => e != state),
          state.changeStatus(status),
          ...solutions.toList().reversed.takeWhile((e) => e != state).toList().reversed
        ]
      );

  UploadingSolutionsState removeSolution(UploadingSolutionState state)
    => UploadingSolutionsState(solutions: solutions.where((e) => e != state));

  UploadingSolutionState get(String id) => solutions.firstWhere((e) => e.id == id);
  bool get isEmpty => solutions.isEmpty;
  int get length => solutions.length;
  int get numberOfLoadingStatus => solutions.where((e) => e.status == UploadingFileStatus.loading).length;
}