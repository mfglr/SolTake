import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/message_endpoints.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/app_client.dart';

class MessageService{
  final AppClient _appClient;

  const MessageService._(this._appClient);
  static final MessageService _singleton = MessageService._(AppClient());
  factory MessageService() => _singleton;

  Future<Iterable<Message>> getMessagesByConversationId(int conversationId,int? lastValue,int? take) async {
    final url = _appClient.generatePaginationUrl("$messageController/$getMessagesByConversationIdEndpoint", lastValue, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Message.fromJson(item));
  }
}