import 'package:my_social_app/custom_packages/entity_state/entity.dart';

class SubjectRequestState extends Entity<int>{
  final DateTime createdAt;
  final String name;
  final int examId;
  final String examName;
  final int state;
  final int? reason;

  SubjectRequestState({
    required super.id,
    required this.createdAt,
    required this.name,
    required this.examId,
    required this.examName,
    required this.state,
    required this.reason
  });
}