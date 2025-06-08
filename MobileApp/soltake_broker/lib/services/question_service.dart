import 'dart:async';
import 'package:soltake_broker/models/question.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class QuestionService{
  static const String _controller = "questions";

  static Future<Iterable<Question>> getAllNotPublishedQuestions(Page page) =>
    AppClient
      .get(AppClient.generatePaginationUrl("$_controller/getAllNotPublishedQuestions", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Question.fromJson(e)));

  static Future<void> publish(int questionId) =>
    AppClient
      .put(
        "$_controller/publish",
        body: {
          'questionId': questionId
        }
      );

  static Future<void> reject(int questionId) =>
    AppClient
      .put(
        "$_controller/reject",
        body: {
          'questionId': questionId
        }
      );

  static Future<void> deleteByAdmin(int questionId) =>
    AppClient
      .delete("$_controller/deleteByAdmin/$questionId");
}