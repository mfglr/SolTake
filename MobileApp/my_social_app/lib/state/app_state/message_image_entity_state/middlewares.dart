import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/image_state/image_status.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void loadMessageImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadMessageImageAction){
    final image = store.state.messageImageEntityState.entities[MessageImageState.generateId(action.messageId, action.index)]!;
    if(image.status == ImageStatus.notStarted){
      MessageService()
        .getMessageImage(action.messageId, action.index)
        .then(
          (image) => store.dispatch(
            LoadMessageImageSuccessAction(
              messageId: action.messageId,
              index: action.index,
              image: image
            )
          )
        );
    }
  }
  next(action);
}