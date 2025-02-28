import 'package:my_social_app/state/entity_state/base_entity.dart';

class SolutionUserSaveState extends BaseEntity<int>{
  final DateTime createdAt;
  final int solutionId;
  final int userId;

  SolutionUserSaveState({
    required super.id,
    required this.createdAt,
    required this.solutionId,
    required this.userId
  });
}