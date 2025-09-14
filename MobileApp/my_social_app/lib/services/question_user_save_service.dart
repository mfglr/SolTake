import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/question_user_save.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/packages/entity_state/page.dart';

class QuestionUserSaveService {
  static const _controllerName = "QuestionUserSaves";
  final AppClient _appClient;

  const QuestionUserSaveService._(this._appClient);
  static final QuestionUserSaveService _singleton = QuestionUserSaveService._(AppClient());
  factory QuestionUserSaveService() => _singleton;

  Future<IdResponse> create(int questionId) =>
    _appClient
      .post("$_controllerName/create", body: { "questionId": questionId })
      .then((json) => IdResponse.fromJson(json));

  Future delete(int questionId) =>
    _appClient
      .delete("$_controllerName/delete/$questionId");

  Future<Iterable<QuestionUserSave>> get(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/get", page))
      .then((json) => json as Iterable)
      .then((list) => list.map((e) => QuestionUserSave.fromJson(e)));
}