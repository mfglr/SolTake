import 'package:soltake_broker/models/exam_request.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class ExamRequestService {
  static const _controller = "ExamRequests";

  static Future<Iterable<ExamRequest>> getPendingExamRequests(Page page) =>
    AppClient
      .get(AppClient.generatePaginationUrl("$_controller/GetPendingExamRequest", page))
      .then((json) => json as Iterable)
      .then((list) => list.map((e) => ExamRequest.fromJson(e)));

  static Future<void> approve(int id) =>
    AppClient
      .put(
        "$_controller/approve",
        body: { 'id': id }
      );

  static Future<void> reject(int id) =>
    AppClient
      .put(
        "$_controller/reject",
        body: { 'id': id }
      );
}