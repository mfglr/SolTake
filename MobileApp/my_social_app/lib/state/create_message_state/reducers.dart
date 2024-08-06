import 'package:my_social_app/state/create_message_state/actions.dart';
import 'package:my_social_app/state/create_message_state/create_message_state.dart';
import 'package:redux/redux.dart';

CreateMessageState clearMessageContentAndImagesReducer(CreateMessageState prev,ClearMessageContentAndImagesAction action)
  => prev.clearContentAndImages();
CreateMessageState changeContentReducer(CreateMessageState prev,ChangeMessageContentAction action)
  => prev.changeContent(action.content);
CreateMessageState changeInterlocutorIdReducer(CreateMessageState prev,ChangeReceiverIdAction action)
  => prev.changeReceiverId(action.receiverId);
CreateMessageState addImagesReducer(CreateMessageState prev,AddMessageImagesAction action)
  => prev.addImages(action.images);
CreateMessageState addImageReducer(CreateMessageState prev,AddMessageImageAction action)
  => prev.addImage(action.image);
CreateMessageState removeImageReducer(CreateMessageState prev,RemoveMessageImageAction action)
  => prev.removeImage(action.image);

Reducer<CreateMessageState> createMessageReducers = combineReducers<CreateMessageState>([
  TypedReducer<CreateMessageState,ClearMessageContentAndImagesAction>(clearMessageContentAndImagesReducer).call,
  TypedReducer<CreateMessageState,ChangeMessageContentAction>(changeContentReducer).call,
  TypedReducer<CreateMessageState,ChangeReceiverIdAction>(changeInterlocutorIdReducer).call,
  TypedReducer<CreateMessageState,AddMessageImagesAction>(addImagesReducer).call,
  TypedReducer<CreateMessageState,AddMessageImageAction>(addImageReducer).call,
  TypedReducer<CreateMessageState,RemoveMessageImageAction>(removeImageReducer).call,
]);