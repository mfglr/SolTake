import 'package:my_social_app/models/user_user_block.dart';
import 'package:my_social_app/services/app_client.dart';

class UserUserBlockService {
  static const _controllerName = "UserUserBlocks";
  final AppClient _appClient;

  const UserUserBlockService._(this._appClient);
  static final UserUserBlockService _singleton = UserUserBlockService._(AppClient());
  factory UserUserBlockService() => _singleton;

  Future<UserUserBlock> create(int blockedId) =>
    _appClient
      .post("$_controllerName/create",body: {'blockedId': blockedId})
      .then((json) => UserUserBlock.fromJson(json));

  Future<void> delete(int blockedId) =>
    _appClient
      .delete("$_controllerName/delete/$blockedId");
}