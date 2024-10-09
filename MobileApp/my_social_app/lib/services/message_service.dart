import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class MessageService{
  final AppClient _appClient;

  const MessageService._(this._appClient);
  static final MessageService _singleton = MessageService._(AppClient());
  factory MessageService() => _singleton;

  Future<MultipartRequest> _createMessageRequest(int receiverId,String? content,Iterable<XFile> images) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$messageController/$createMessageEndpoint")
    );
    request.headers.addAll(_appClient.getHeader());
    for(final image in images){
      request.files.add(await MultipartFile.fromPath("images",image.path));
    }
    request.fields["receiverId"] = receiverId.toString();
    if(content != null) request.fields["content"] = content;
    return request;
  }
  Future<Message> createMessage(int receiverId,String? content,Iterable<XFile> images) =>
    _createMessageRequest(receiverId,content,images)
      .then((request) => request.send())
      .then((response) async {
        if(response.statusCode >= 400){
          if(response.statusCode == 401){
            return await _appClient
              .loginByRefreshToken()
              .then((_) => _createMessageRequest(receiverId, content, images))
              .then((request) => request.send());
          }
          var message = utf8.decode(await response.stream.toBytes());
          throw BackendException(message: message, statusCode: response.statusCode);
        }
        return response;
      })
      .then(
        (response) => response.stream
          .toBytes()
          .then((bytes) => utf8.decode(bytes))
          .then((data){
            if(response.statusCode > 400){
              throw BackendException(message: data,statusCode: response.statusCode);
            }
            return Message.fromJson(jsonDecode(data));
          })
      );
  
  Future<void> removeMessage(int messageId) =>
    _appClient
      .delete("$messageController/$removeMessageEndpoint");

  Future<void> removeMessages(Iterable<int> messageIds) =>
    _appClient
      .delete(
        "$messageController/$removeMessagesEndpoint",
        body:{ 'messageIds': messageIds }
      );

  Future<void> removeMessagesByUserIds(Iterable<int> userIds) =>
    _appClient
      .delete(
        "$messageController/$removeMessagesByUserIdsEndpoint",
        body: { 'userIds': userIds.toList() }
      );

  Future<Iterable<Message>> getMessagesByUserId(int userId, Page page) => 
    _appClient
      .get(_appClient.generatePaginationUrl("$messageController/$getMessagesByUserIdEndpoint/$userId", page))
      .then((json) => json as List)
      .then((list) =>  list.map((item) => Message.fromJson(item)));

  Future<Iterable<Message>> getConversations(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$messageController/$getConversationsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Message.fromJson(item)));

  Future<Iterable<Message>> getUnviewedMessages() =>
    _appClient
      .get("$messageController/$getUnviewedMessagesEndpoint")
      .then((json) => json as List)
      .then((list) => list.map((item) => Message.fromJson(item)));

  Future<Uint8List> getMessageImage(int messageId,int index) => 
    _appClient
      .getBytes("$messageController/$getMessageImageEndpoint/$messageId/$index");

  Future<Message> getMessageById(int messageId) =>
    _appClient
      .get("$messageController/$getMessageByIdEndpoint/$messageId")
      .then((json) => Message.fromJson(json));
  
}