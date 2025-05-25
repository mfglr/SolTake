import 'package:my_social_app/state/entity_state/entity.dart';

class SolutionUserSaveState extends Entity<int>{
  final int solutionId;
  SolutionUserSaveState({required super.id, required this.solutionId});
}