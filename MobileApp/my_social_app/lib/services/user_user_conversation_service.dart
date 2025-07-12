import 'package:my_social_app/models/user_user_conversation.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class UserUserConversationService{
  static const _controllerName = "UserUserConversations";
  final AppClient _appClient;

  const UserUserConversationService._(this._appClient);
  static final UserUserConversationService _singleton = UserUserConversationService._(AppClient());
  factory UserUserConversationService() => _singleton;

  Future<Iterable<UserUserConversation>> get(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/Get", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => UserUserConversation.fromJson(e)));

}