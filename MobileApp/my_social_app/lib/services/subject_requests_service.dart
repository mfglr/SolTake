import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/subject_request.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class SubjectRequestsService{
  static const _controller = "SubjectRequests";
  static Future<IdResponse> create(int examId, String name) =>
    AppClient()
      .post(
        "$_controller/create",
        body: {
          'examId': examId,
          'name': name
        }
      )
      .then((json) => IdResponse.fromJson(json));

  static Future<Iterable<SubjectRequest>> getSubjectRequests(Page page) =>
    AppClient()
      .get(AppClient().generatePaginationUrl("$_controller/GetSubjectRequests", page))
      .then((json) => json as Iterable)
      .then((list) => list.map((e) => SubjectRequest.fromJson(e)));

  static Future<void> delete(int id) =>
    AppClient()
      .delete("$_controller/delete/$id");
}