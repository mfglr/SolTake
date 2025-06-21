import 'package:soltake_broker/models/subject_request.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class SubjectRequestsService{
  static const _controller = "SubjectRequests";
  
  static Future<void> approve(int id) =>
    AppClient.put("$_controller/approve",body: { 'id' : id });
  
  static Future<void> reject(int id, int reason) =>
    AppClient.put("$_controller/reject", body: { 'id' : id, 'reason': reason });

  static Future<Iterable<SubjectRequest>> getPendings(Page page) =>
    AppClient
      .get(AppClient.generatePaginationUrl("$_controller/GetPendings", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => SubjectRequest.fromJson(e)));

}