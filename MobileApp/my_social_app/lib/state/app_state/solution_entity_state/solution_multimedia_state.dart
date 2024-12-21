import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';

class SolutionMultimediaState extends MultimediaState{
  final int id;
  final int solutionId;

  const SolutionMultimediaState({
    required this.id,
    required this.solutionId,
    required super.containerName,
    required super.blobName,
    required super.blobNameOfFrame,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType,
  });
  
}