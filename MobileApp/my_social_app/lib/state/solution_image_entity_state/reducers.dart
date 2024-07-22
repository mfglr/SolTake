import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_entity_state.dart';
import 'package:redux/redux.dart';

SolutionImageEntityState addSolutionImagesReducer(SolutionImageEntityState prev,AddSolutionImagesAction action)
  => SolutionImageEntityState(entities: prev.appendMany(action.images));

SolutionImageEntityState addSolutionImagesListsReducer(SolutionImageEntityState prev,AddSolutionImagesListsAction action)
  => SolutionImageEntityState(entities: prev.appendLists(action.lists));

Reducer<SolutionImageEntityState> solutionImagesStateReducers = combineReducers<SolutionImageEntityState>([
  TypedReducer<SolutionImageEntityState,AddSolutionImagesAction>(addSolutionImagesReducer).call,
  TypedReducer<SolutionImageEntityState,AddSolutionImagesListsAction>(addSolutionImagesListsReducer).call
]);