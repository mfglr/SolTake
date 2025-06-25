import 'package:my_social_app/services/app_client.dart';

class QuestionUserComplaintService{
  static const _controller = "QuestionUserComplaints";

  static Future<void> create(int questionId, int reason, String? content)
    => AppClient()
        .post(
          "$_controller/create",
          body: { 'questionId': questionId, 'reason': reason, 'content': content }
        );
}