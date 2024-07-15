import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/exam_endpoints.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/services/app_client.dart';

class ExamService{
  final AppClient _appClient;

  const ExamService._(this._appClient);
  static final ExamService _singleton = ExamService._(AppClient());
  factory ExamService() => _singleton;

  Future<List<Exam>> getAll() async {
    final list = await _appClient.get("$examController/$getAllExams");
    return list.map((e) => Exam.fromJson(e)).toList();
  }

}