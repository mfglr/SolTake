import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/exam_endpoints.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/packages/entity_state/page.dart';

class ExamService{
  final AppClient _appClient;

  const ExamService._(this._appClient);
  static final ExamService _singleton = ExamService._(AppClient());
  factory ExamService() => _singleton;

  Future<Iterable<Exam>> getExams(Page page) => 
    _appClient
      .get(_appClient.generatePaginationUrl("$examController/$getExamsEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Exam.fromJson(e)));

  Future<Exam> getExamById(num examId) =>
    _appClient
      .get("$examController/$getExamByIdEndpoint")
      .then((json) => Exam.fromJson(json));

  Future<Iterable<Exam>> search(String key, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$examController/search", page, values: { 'key': key }))
      .then((json) => json as List)
      .then((list) => list.map((e) => Exam.fromJson(e)));
}