import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/solution_user_save.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class SolutionUserSaveService {
  static const _controllerName = "SolutionUserSaves";
  final AppClient _appClient;

  const SolutionUserSaveService._(this._appClient);
  static final SolutionUserSaveService _singleton = SolutionUserSaveService._(AppClient());
  factory SolutionUserSaveService() => _singleton;

  Future<IdResponse> create(int solutinId) =>
    _appClient
      .post("$_controllerName/create", body: { 'solutionId': solutinId })
      .then((json) => IdResponse.fromJson(json));

  Future delete(int solutionId) =>
    _appClient
      .delete("$_controllerName/delete/$solutionId");

  Future<Iterable<SolutionUserSave>> get(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/get", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => SolutionUserSave.fromJson(e)));

}