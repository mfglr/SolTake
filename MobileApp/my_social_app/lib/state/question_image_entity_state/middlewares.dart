import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void loadQuestionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionImageAction){
    final imageState = store.state.questionImageEntityState.images[action.id]!;
    if(imageState.state == ImageState.notStarted){
      QuestionService()
        .getQuestionImage(imageState.questionId, imageState.blobName!)
        .then((image) => store.dispatch(LoadQuestionImageSuccessAction(id: action.id, image: image)));
    }
  }
  next(action);
}