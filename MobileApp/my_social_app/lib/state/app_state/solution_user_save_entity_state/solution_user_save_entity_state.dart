import 'package:collection/collection.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

class SolutionUserSaveEntityState extends EntityState<SolutionUserSaveState>{
  const SolutionUserSaveEntityState({required super.entities});

  SolutionUserSaveEntityState addSaves(Iterable<SolutionUserSaveState> saves)
    => SolutionUserSaveEntityState(entities: appendMany(saves));
  SolutionUserSaveEntityState addSave(SolutionUserSaveState save)
    => SolutionUserSaveEntityState(entities: appendOne(save));
  SolutionUserSaveEntityState removeSave(int id)
    => SolutionUserSaveEntityState(entities: removeOne(id));

  SolutionUserSaveState? select(int solutionId,int userId)
    => entities.values.firstWhereOrNull((e) => e.solutionId == solutionId && e.appUserId == userId);

}