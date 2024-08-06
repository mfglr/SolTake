import 'package:my_social_app/services/solution_service.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/solution_image_entity_state/actions.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void loadSolutionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadSolutionImageAction){
    final SolutionImageState imageState = store.state.solutionImageEntityState.entities[action.id]!;
    if(imageState.state == ImageStatus.notStarted){
      SolutionService()
        .getImage(imageState.solutionId, imageState.blobName)
        .then((image) => store.dispatch(LoadSolutionImageSuccessAction(id: action.id, image: image)));
    }
  }
  next(action);
}