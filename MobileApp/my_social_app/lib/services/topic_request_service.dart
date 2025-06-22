import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/topic_request.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class TopicRequestService {
  static const _controller = "TopicRequests";

  static Future<IdResponse> create(int subjectId, String name) =>
    AppClient()
      .post("$_controller/create",body: { 'subjectId': subjectId, 'name': name})
      .then((json) => IdResponse.fromJson(json));

  static Future<void> delete(int id) =>
    AppClient().delete("$_controller/delete/$id");

  static Future<Iterable<TopicRequest>> getTopicRequests(Page page) =>
    AppClient()
      .get(AppClient().generatePaginationUrl("$_controller/GetTopicRequests", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => TopicRequest.fromJson(e)));
}