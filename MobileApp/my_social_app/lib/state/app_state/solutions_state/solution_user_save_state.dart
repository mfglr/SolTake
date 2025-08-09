import 'package:my_social_app/state/app_state/solutions_state/solution_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

class SolutionUserSaveState extends Entity<int> {
  final SolutionState solution;
  SolutionUserSaveState({required super.id, required this.solution});
}