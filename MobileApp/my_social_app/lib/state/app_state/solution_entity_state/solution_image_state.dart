import 'dart:typed_data';
import 'package:my_social_app/state/app_state/image_state/image_state.dart';
import 'package:my_social_app/state/app_state/image_state/image_status.dart';

class SolutionImageState extends ImageState{
  final int id;
  final int solutionId;
  final String blobName;

  const SolutionImageState({
    required this.id,
    required super.height,
    required super.width,
    required super.state,
    required super.data,
    required this.solutionId,
    required this.blobName,
  });

  SolutionImageState startLoading(){
    if(state != ImageStatus.notStarted) return this;
    return SolutionImageState(
      id: id,
      solutionId: solutionId,
      blobName: blobName,
      height: height,
      width: width,
      state: ImageStatus.started,
      data: data
    );
  }

  SolutionImageState load(Uint8List data)
    => SolutionImageState(
        id: id,
        solutionId: solutionId,
        blobName: blobName,
        height: height,
        width: width,
        state: ImageStatus.done,
        data: data
      );
}