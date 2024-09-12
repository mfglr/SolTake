import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_entity_state.dart';
import 'package:redux/redux.dart';

MessageImageEntityState addMessageImageReducer(MessageImageEntityState prev,AddMessageImageAction action)
  => prev.addMessageImage(action.image);
MessageImageEntityState addMessageImagesReducer(MessageImageEntityState prev,AddMessageImagesAction action)
  => prev.addMessageImages(action.images);
MessageImageEntityState addMessageImagesListReducer(MessageImageEntityState prev,AddMessageImagesListAction action)
  => prev.addMessageImagesList(action.list);
MessageImageEntityState removeMessageImagesReducer(MessageImageEntityState prev,RemoveMessageImagesAction action)
  => prev.removeMessageImages(action.messageId);
MessageImageEntityState removeMessagesImagesReducer(MessageImageEntityState prev,RemoveMessagesImagesAction action)
  => prev.removeMessagesImages(action.messageIds);

MessageImageEntityState loadMessageImageReducer(MessageImageEntityState prev,LoadMessageImageAction action)
  => prev.startLoading(action.messageId, action.index);
MessageImageEntityState loadMessageImageSuccessReducer(MessageImageEntityState prev,LoadMessageImageSuccessAction action)
  => prev.load(action.messageId, action.index, action.image);

Reducer<MessageImageEntityState> messageImageEntityReducers = combineReducers<MessageImageEntityState>([
  TypedReducer<MessageImageEntityState,AddMessageImageAction>(addMessageImageReducer).call,
  TypedReducer<MessageImageEntityState,AddMessageImagesAction>(addMessageImagesReducer).call,
  TypedReducer<MessageImageEntityState,AddMessageImagesListAction>(addMessageImagesListReducer).call,
  TypedReducer<MessageImageEntityState,RemoveMessageImagesAction>(removeMessageImagesReducer).call,
  TypedReducer<MessageImageEntityState,RemoveMessagesImagesAction>(removeMessagesImagesReducer).call,
  
  TypedReducer<MessageImageEntityState,LoadMessageImageAction>(loadMessageImageReducer).call,
  TypedReducer<MessageImageEntityState,LoadMessageImageSuccessAction>(loadMessageImageSuccessReducer).call,
]);