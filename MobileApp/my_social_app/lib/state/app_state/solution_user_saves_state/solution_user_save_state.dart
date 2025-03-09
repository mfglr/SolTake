import 'package:my_social_app/state/entity_state/base_entity.dart';

class SolutionUserSaveState extends BaseEntity<int>{
  final int solutionId;
  SolutionUserSaveState({required super.id, required this.solutionId});
}