import 'dart:convert';
import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class MessageService{
  final AppClient _appClient;

  const MessageService._(this._appClient);
  static final MessageService _singleton = MessageService._(AppClient());
  factory MessageService() => _singleton;

  Future<MultipartRequest> _createMessageRequest(num receiverId,String? content,Iterable<AppFile> medias) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$messageController/$createMessageEndpoint")
    );
    for(final media in medias){
      request.files.add(await MultipartFile.fromPath("medias",media.file.path,contentType: MediaType.parse(media.contentType)));
    }
    request.fields["receiverId"] = receiverId.toString();
    if(content != null) request.fields["content"] = content;
    return request;
  }
  Future<Message> createMessage(num receiverId,String? content,Iterable<AppFile> medias,void Function(double) callback) =>
    _createMessageRequest(receiverId,content,medias)
      .then((request) => _appClient.postStream(request,callback))
      .then((data) => Message.fromJson(jsonDecode(data)));
  
  Future<void> removeMessage(num messageId) =>
    _appClient
      .delete("$messageController/$removeMessageEndpoint");

  Future<void> removeMessages(Iterable<num> messageIds) =>
    _appClient
      .delete(
        "$messageController/$removeMessagesEndpoint",
        body:{ 'messageIds': messageIds }
      );

  Future<void> removeMessagesByUserIds(Iterable<num> userIds) =>
    _appClient
      .delete(
        "$messageController/$removeMessagesByUserIdsEndpoint",
        body: { 'userIds': userIds.toList() }
      );

  Future<Iterable<Message>> getMessagesByUserId(num userId, Page page) => 
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
 
  Future<Message> getMessageById(num messageId) =>
    _appClient
      .get("$messageController/$getMessageByIdEndpoint/$messageId")
      .then((json) => Message.fromJson(json));
}