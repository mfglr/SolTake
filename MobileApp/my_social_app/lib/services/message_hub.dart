import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/models/message_connection.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_message_state/actions.dart';
import 'package:my_social_app/state/entity_state/page.dart';
import 'package:redux/redux.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class MessageHub{
  late final HubConnection _hubConnection;
  String? _acessToken;

  MessageHub._(Store<AppState> store){
    _hubConnection =
      HubConnectionBuilder()
        .withUrl(
          "${dotenv.env['API_URL']}/message",
          options: HttpConnectionOptions(accessTokenFactory: () => Future.value(_acessToken)),
        )
        .withAutomaticReconnect()
        .build();

    _hubConnection
      .onreconnected(({connectionId}) => store.dispatch(const GetUnviewedMessagesAction()));

    _on(store);
  }

  static MessageHub? _singleton;
  factory MessageHub() => _singleton!;
  
  static Future<void> init(String accessToken, Store<AppState> store) async {
    if(_singleton == null){
      _singleton = MessageHub._(store);
      _singleton!._acessToken = accessToken;
      await _singleton!._hubConnection.start();
      store.dispatch(const GetUnviewedMessagesAction());
      return;
    }
    _singleton!._acessToken = accessToken;
  }

  void _on(Store<AppState> store){
    _hubConnection
      .on(
        changeMessageConnectionState,
        (list){
          store.dispatch(
            UpdateMessageConnectionStateAction(
              state: MessageConnection.fromJson(list!.first as dynamic).toMessageConnectionState()
            )
          );
        }
      );

    _hubConnection
      .on(
        receiveMessage,
        (list){
          final messageState = Message.fromJson((list!.first as dynamic)).toMessageState();
          store.dispatch(AddMessageAction(message: messageState));
          store.dispatch(AddUserMessageAction(userId: messageState.senderId, messageId: messageState.id));
          store.dispatch(MarkMessagesAsReceivedAction(messageIds: [messageState.id]));
        }
      );

    _hubConnection
      .on(
        messageReceivedNotification,
        (list) => store.dispatch(MarkMessagesAsReceivedSuccessAction(messageIds: [list!.first as int]))
      );

    _hubConnection
      .on(
        messageViewedNotification,
        (list) => store.dispatch(MarkMessagesAsViewedSuccessAction(messageIds: [list!.first as int]))
      );

    _hubConnection
      .on(
        removeMessagesNotification,
        (list){
          var messageIds = list!.map((e) => e as int);
          for(var messageId in messageIds){
            var message = store.state.messageEntityState.getValue(messageId);
            if(message != null){
              store.dispatch(RemoveUserMessagesAction(userId: message.conversationId, messageIds: [messageId]));
            }
          }
          store.dispatch(RemoveMessagesSuccessAction(messageIds: messageIds));
        }
      );
  }

  void onReceivedMessage(void Function(Message) callback)
    => _hubConnection
        .on(receiveMessage1, (list) => callback(Message.fromJson((list!.first as dynamic))));
  void offReceivedMessage() => _hubConnection.off(receiveMessage1);

  static Future<void> close() async{
    if(_singleton != null){
      _singleton!._hubConnection.off(changeMessageConnectionState);
      _singleton!._hubConnection.off(receiveMessage);
      _singleton!._hubConnection.off(messageReceivedNotification);
      _singleton!._hubConnection.off(messageViewedNotification);
      await _singleton!._hubConnection.stop();
    }
    _singleton = null;
  }

  Future<Message> createMessage(num receiverId,String content)
    => _hubConnection
        .invoke("CreateMessage", args: [{'receiverId': receiverId, 'content': content}])
        .then((response) => Message.fromJson(response as dynamic));

  Future<void> removeMessages(Iterable<int> messageIds, bool everyone)
    => _hubConnection
        .invoke("RemoveMessages", args: [{ 'messageIds': messageIds.toList(), 'everyone': everyone }]);
  
  Future<void> removeMessagesByUserIds(Iterable<int> userIds)
    => _hubConnection
        .invoke("RemoveMessagesByUserIds", args: [{ 'userIds': userIds}]);
  
  Future changeStateToFocused(int userId)
    => _hubConnection
        .invoke("ChangeStateToFocused", args: [{'userId': userId}]);

  Future changeStateToTyping(int userId)
    => _hubConnection
        .invoke("ChangeStateToTyping", args: [{'userId' : userId}]);

  Future chageStateToOnline()
    => _hubConnection
        .invoke("ChangeStateToOnline");
 
  Future<void> markMessagesAsReceived(Iterable<int> ids)
    => _hubConnection
        .invoke("MarkMessagesAsReceived", args: [{'messageIds': ids.toList()}]);

  Future<void> markMessagesAsViewed(Iterable<int> ids)
    => _hubConnection
        .invoke("MarkMessagesAsViewed",args: [{'messageIds': ids.toList()}]);

  Future<MessageConnection> getMessageConnectionById(int userId)
    => _hubConnection
        .invoke("GetMessageConnectionById", args: [{'id': userId}])
        .then((json) => MessageConnection.fromJson(json as dynamic));
  
  Future<Message> getMessageById(int messageId)
    => _hubConnection
        .invoke("GetMessageById",args: [{'messageId': messageId}])
        .then((json) => Message.fromJson(json as dynamic));

  Future<Iterable<Message>> getByUserId(int userId,Page page)
    => _hubConnection
        .invoke("GetByUserId",args: [{'userId': userId, 'offset': page.offset, 'take': page.take, 'isDescending': page.isDescending}])
        .then((json) => json as Iterable)
        .then((list) => list.map((e) => Message.fromJson(e)));
  
  Future<Iterable<Message>> getUnviewedMessages()
    => _hubConnection
        .invoke("GetUnviewedMessages",args: [{}])
        .then((json) => json as Iterable)
        .then((list) => list.map((e) => Message.fromJson(e)));

  Future<Iterable<Message>> getConversations(Page page)
    => _hubConnection
        .invoke("GetConversations", args: [{'offset': page.offset, 'take': page.take, 'isDescending': page.isDescending}])
        .then((json) => json as Iterable)
        .then((list) => list.map((e) => Message.fromJson(e)));
}