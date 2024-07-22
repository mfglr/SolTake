import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';

@immutable
class AddSolutionImagesAction extends redux.Action{
  final Iterable<SolutionImageState> images;
  const AddSolutionImagesAction({required this.images});
}

@immutable
class AddSolutionImagesListsAction extends redux.Action{
  final Iterable<Iterable<SolutionImageState>> lists;
  const AddSolutionImagesListsAction({required this.lists});
}