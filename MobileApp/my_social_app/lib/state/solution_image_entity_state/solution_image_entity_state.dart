import 'dart:typed_data';

import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';

class SolutionImageEntityState extends EntityState<SolutionImageState>{
  const SolutionImageEntityState({required super.entities});

  SolutionImageEntityState load(int id, Uint8List image)
    => SolutionImageEntityState(entities: updateOne(entities[id]!.load(image)));

  
  Iterable<SolutionImageState> getSolutionImages(int solutionId)
    => entities.values.where((e) => e.solutionId == solutionId);
}