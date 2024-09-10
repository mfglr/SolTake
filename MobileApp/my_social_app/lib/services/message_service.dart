import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/pagination/page.dart';

class MessageService{
  final AppClient _appClient;

  const MessageService._(this._appClient);
  static final MessageService _singleton = MessageService._(AppClient());
  factory MessageService() => _singleton;

  Future<Message> createMessage(int receiverId,String? content,Iterable<XFile> images) async {
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$messageController/$createMessageEndpoint")
    );
    for(final image in images){
      request.files.add(await MultipartFile.fromPath("images",image.path));
    }
    request.fields["receiverId"] = receiverId.toString();
    if(content != null) request.fields["content"] = content;
    
    final response = await _appClient.send(request);
    final json = jsonDecode(utf8.decode(await response.stream.toBytes()));
    return Message.fromJson(json);
  }

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