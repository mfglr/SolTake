import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/exam_endpoints.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/services/http_service.dart';

class ExamService{
  final HttpService _httpService;

  const ExamService._(this._httpService);
  static final ExamService _singleton = ExamService._(HttpService());
  factory ExamService() => _singleton;
  

  Future<List<Exam>> getAll() async {
    final list = await _httpService.getList("$examController/$getAllExams");
    return list.map((e) => Exam.fromJson(e)).toList();
  }

}