import 'package:soltake_broker/models/topic_request.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class TopicRequestService {
  static const _controller = "TopicRequests";
  
  static Future<Iterable<TopicRequest>> getPendingTopicRequests(Page page) =>
    AppClient
      .get(AppClient.generatePaginationUrl("$_controller/GetPendingTopicRequests", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => TopicRequest.fromJson(e)));

  static Future<void> approve(int id) =>
    AppClient
      .put("$_controller/approve",body: { 'id': id });
  
  static Future<void> reject(int id, int reason) =>
    AppClient
      .put("$_controller/reject", body: { 'id': id, 'reason': reason } );
}