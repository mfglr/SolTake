import 'package:my_social_app/models/exam_request.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/packages/entity_state/page.dart';

class ExamRequestService {
  static final AppClient _appClient = AppClient();
  static const String _controllerName = "ExamRequests"; 
  
  static Future<IdResponse> create(String name, String initialisms) =>
    _appClient
      .post(
        "$_controllerName/create",
        body: {
          "name": name,
          "initialism": initialisms
        }
      )
      .then((json) => IdResponse.fromJson(json));

  static Future<void> delete(int id) =>
    _appClient
      .delete("$_controllerName/delete/$id");

  static Future<Iterable<ExamRequest>> getExamRequests(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/GetExamRequests", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => ExamRequest.fromJson(e)));
}