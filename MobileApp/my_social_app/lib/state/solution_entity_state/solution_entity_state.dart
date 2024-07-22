import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart/entity_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

@immutable
class SolutionEntityState extends EntityState<SolutionState>{
  const SolutionEntityState({required super.entities});  
}