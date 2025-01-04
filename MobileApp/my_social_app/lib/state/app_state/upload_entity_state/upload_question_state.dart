import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';

class UploadQuestionState extends UploadState{
  final String content;
  final int examId;
  final int subjectId;
  final int? topicId;

  UploadQuestionState._({
    required super.id,
    required super.medias,
    required super.rate,
    required super.status,
    required this.content,
    required this.examId,
    required this.subjectId,
    required this.topicId,
  });

  @override
  UploadQuestionState changeRate(double rate) => UploadQuestionState._(
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
  UploadQuestionState changeStatus(UploadStatus status) => UploadQuestionState._(
    id: id,
    medias: medias,
    rate: rate,
    status: status,
    content: content,
    examId: examId,
    subjectId: subjectId,
    topicId: topicId
  );

  factory UploadQuestionState.init(CreateQuestionAction action) => UploadQuestionState._(
    id: action.id,
    medias: action.medias,
    rate: 0,
    status: UploadStatus.loading,
    content: action.content,
    examId: action.examId,
    subjectId: action.subjectId,
    topicId: action.topicId
  );
  
}