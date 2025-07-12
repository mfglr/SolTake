import 'package:test_app/models/exam.dart';
import 'package:test_app/models/exam_state.dart';
import 'package:test_app/services/app_client.dart';
import 'package:test_app/state/entity_state/pagination_state/page.dart';

class ExamService{
  static const _controller = "exams";
  final AppClient _appClient;

  const ExamService._(this._appClient);
  static final ExamService _singleton = ExamService._(AppClient());
  factory ExamService() => _singleton;

  Future<Iterable<ExamState>> getExams(Page page, {dynamic parameters}) => 
    _appClient
      .get(_appClient.generatePaginationUrl("$_controller/getExams", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Exam.fromJson(e).toExamState()));

  Future<Exam> getExamById(num examId) =>
    _appClient
      .get("$_controller/getExamById")
      .then((json) => Exam.fromJson(json));

  Future<Iterable<Exam>> search(String key, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controller/search", page, values: { 'key': key }))
      .then((json) => json as List)
      .then((list) => list.map((e) => Exam.fromJson(e)));
}