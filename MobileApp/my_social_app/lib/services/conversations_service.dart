import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/conversations_endpoints.dart';
import 'package:my_social_app/models/conversation.dart';
import 'package:my_social_app/services/app_client.dart';

class ConversationsService{
  final AppClient _appClient;

  const ConversationsService._(this._appClient);
  static final ConversationsService _singleton = ConversationsService._(AppClient());
  factory ConversationsService() => _singleton;

  Future<Iterable<Conversation>> getConversations(DateTime? lastDate,int? take) async {
    final url = _appClient.generatePaginationUrl("$conversationController/$getConversationsEndpoint", lastDate, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => Conversation.fromJson(item));
  }
}