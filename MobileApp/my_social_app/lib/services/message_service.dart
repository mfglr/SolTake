import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';

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

  Future<Iterable<Message>> getMessagesByUserId(int userId, int? offset, int take, bool isDescending) async {
    final endpoint = "$messageController/$getMessagesByUserIdEndpoint/$userId";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Message.fromJson(item));
  }

  Future<Iterable<Message>> getConversations(int? offset, int take, bool isDescending) async {
    const endpoint = "$messageController/$getConversationsEndpoint";
    final url = _appClient.generatePaginationUrl(endpoint, offset, take, isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Message.fromJson(item));
  }

  Future<Iterable<Message>> getNewCommingMessages() async {
    const url = "$messageController/$getNewCommingMessagesEndpoint";
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Message.fromJson(item));
  }

  Future<Uint8List> getMessageImage(int messageId,int messageImageId)
    => _appClient.getBytes(
      "$messageController/$getMessageImageEndpoint/$messageId/$messageImageId"
    );
  
}