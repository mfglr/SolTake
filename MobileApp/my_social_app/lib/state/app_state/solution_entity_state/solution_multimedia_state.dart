import 'dart:typed_data';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';

class SolutionMultimediaState extends MultimediaState{
  final int id;
  final int solutionId;

  const SolutionMultimediaState({
    required this.id,
    required this.solutionId,
    required super.containerName,
    required super.blobName,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType,
    required super.status,
    required super.data,
  });

  SolutionMultimediaState startLoading(){
    if(status != MultimediaStatus.notStarted) return this;
    return SolutionMultimediaState(
      id: id,
      solutionId: solutionId,
      containerName: containerName,
      blobName: blobName,
      size: size,
      height: height,
      width: width,
      duration: duration,
      multimediaType: multimediaType,
      status: MultimediaStatus.started,
      data: data
    );
  }

  SolutionMultimediaState load(Uint8List data)
    => SolutionMultimediaState(
        id: id,
        solutionId: solutionId,
        containerName: containerName,
        blobName: blobName,
        size: size,
        height: height,
        width: width,
        duration: duration,
        multimediaType: multimediaType,
        status: MultimediaStatus.done,
        data: data
      );
}