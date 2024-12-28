import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

class UploadQuestionState extends UploadState{
  final String content;
  final int examId;
  final int subjectId;
  final int topicId;

  UploadQuestionState({
    required super.id,
    required super.medias,
    required super.rate,
    required super.status,
    required this.content,
    required this.examId,
    required this.subjectId,
    required this.topicId
  });

  @override
  UploadQuestionState changeRate(double rate) => UploadQuestionState(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    content: content,
    examId: examId,
    subjectId: subjectId,
    topicId: topicId
  );

  @override
  UploadQuestionState changeStatus(UploadStatus status) => UploadQuestionState(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    content: content,
    examId: examId,
    subjectId: subjectId,
    topicId: topicId
  );
  
}