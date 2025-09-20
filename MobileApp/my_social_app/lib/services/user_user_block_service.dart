import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/user_user_block.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';

class UserUserBlockService {
  static const _controllerName = "UserUserBlocks";
  final AppClient _appClient;

  const UserUserBlockService._(this._appClient);
  static final UserUserBlockService _singleton = UserUserBlockService._(AppClient());
  factory UserUserBlockService() => _singleton;

  Future<IdResponse> create(int blockedId) =>
    _appClient
      .post("$_controllerName/create", body: { 'blockedId': blockedId })
      .then((json) => IdResponse.fromJson(json));

  Future<void> delete(int blockedId) =>
    _appClient
      .delete("$_controllerName/delete/$blockedId");

  Future<Iterable<UserUserBlock>> getBlockeds(Page page) =>
    _appClient
      .get( _appClient.generatePaginationUrl("$_controllerName/getBlockeds", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => UserUserBlock.fromJson(e)));
}