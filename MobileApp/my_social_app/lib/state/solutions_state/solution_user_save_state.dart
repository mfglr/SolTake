import 'package:my_social_app/state/solutions_state/solution_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

class SolutionUserSaveState extends Entity<int> {
  final SolutionState solution;
  SolutionUserSaveState({required super.id, required this.solution});
}