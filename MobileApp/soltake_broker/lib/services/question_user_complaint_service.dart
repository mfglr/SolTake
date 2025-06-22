import 'package:soltake_broker/models/question_user_complaint.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class QuestionUserComplaintService {
  static const _controller = "QuestionUserComplaints";

  static Future<Iterable<QuestionUserComplaint>> getUnviewedQuestionUserComplaints(Page page) =>
    AppClient
      .get(AppClient.generatePaginationUrl("$_controller/GetUnviewedQuestionUserComplaints", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => QuestionUserComplaint.fromJson(e)));

  static Future<void> view(int id) =>
    AppClient
      .put("$_controller/view", body: { 'id': id});
}