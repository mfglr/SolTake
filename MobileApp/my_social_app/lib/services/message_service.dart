import 'dart:convert';
import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';

class MessageService{
  final AppClient _appClient;

  const MessageService._(this._appClient);
  static final MessageService _singleton = MessageService._(AppClient());
  factory MessageService() => _singleton;

  Future<MultipartRequest> _createMessageRequest(num receiverId,String? content,Iterable<AppFile> medias) async{
    MultipartRequest request = MultipartRequest(
      "POST",
      _appClient.generateUri("$messageController/createMessage")
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
}