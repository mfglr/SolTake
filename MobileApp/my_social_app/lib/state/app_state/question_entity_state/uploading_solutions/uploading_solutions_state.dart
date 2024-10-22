import 'package:camera/camera.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solution_state.dart';

class UploadingSolutionsState {
  final Iterable<UploadingSolutionState> solutions;
  const UploadingSolutionsState({required this.solutions});

  UploadingSolutionsState addVideoSolution(String id, int questionId, String? content, XFile video)
    => UploadingSolutionsState(
        solutions: [
          ...solutions,
          UploadingSolutionState(
            id: id,
            questionId: questionId,
            content: content,
            images: null,
            video: video,
            rate: 0
          )
        ]
      );
  
  UploadingSolutionsState addSolution(String id, int questionId,String? content,Iterable<XFile> images)
    => UploadingSolutionsState(
        solutions: [
          ...solutions,
          UploadingSolutionState(
            id:id,
            questionId: questionId,
            content: content,
            images: images,
            video: null,
            rate: 0
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

  UploadingSolutionsState removeSolution(UploadingSolutionState state)
    => UploadingSolutionsState(solutions: solutions.where((e) => e != state));

  UploadingSolutionState get(String id) => solutions.firstWhere((e) => e.id == id);
  bool get isEmpty => solutions.isEmpty;
  int get length => solutions.length;
}