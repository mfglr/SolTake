import 'package:my_social_app/models/ai_model.dart';
import 'package:my_social_app/services/app_client.dart';

class AIModelService{
  static const String _controllerName = "AIModels";
  final AppClient _appClient;
  
  const AIModelService._(this._appClient);
  static final AIModelService _singleton = AIModelService._(AppClient());
  factory AIModelService() => _singleton;

  Future<Iterable<AIModel>> getAll() =>
    _appClient
      .get("$_controllerName/getAll")
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => AIModel.fromJson(e)));
}