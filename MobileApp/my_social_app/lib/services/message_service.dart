import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/models/user.dart';
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

  Future<Iterable<Message>> getMessagesByUserId(int userId,int? lastValue,int? take) async {
    final url = _appClient.generatePaginationUrl(
      "$messageController/$getMessagesByUserIdEndpoint/$userId",
      lastValue,
      take
    );
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Message.fromJson(item));
  }

  Future<Iterable<User>> getConversations(int? lastValue,int? take) async {
    final url = _appClient.generatePaginationUrl(
      "$messageController/$getConversationsEndpoint",
      lastValue,
      take
    );
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getNewMessagesSenders() async {
    const url = "$messageController/$getNewMessagesSendersEndpoint";
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }
}