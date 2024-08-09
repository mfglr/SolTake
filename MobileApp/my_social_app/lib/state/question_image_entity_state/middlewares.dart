import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/question_image_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void loadQuestionImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadQuestionImageAction){
    final imageState = store.state.questionImageEntityState.entities[action.id]!;
    if(imageState.state == ImageStatus.notStarted){
      QuestionService()
        .getQuestionImage(imageState.questionId, imageState.blobName!)
        .then((image) => store.dispatch(LoadQuestionImageSuccessAction(id: action.id, image: image)))
        .catchError((error) => {
          if(error is BackendException && error.statusCode == 404){
            store.dispatch(QuestionImageNotFoundAction(questionImageId: action.id))
          }
          else{
            store.dispatch(QuestionImageCouldNotLoadAction(questionId: action.id))
          }
        });
    }
  }
  next(action);
}