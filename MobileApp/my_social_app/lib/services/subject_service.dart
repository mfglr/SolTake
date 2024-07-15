import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/subjcet_endpoints.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/services/http_service.dart';

class SubjectService{
  final HttpService _httpService;
  
  SubjectService._(this._httpService);
  static final SubjectService _singleton = SubjectService._(HttpService());
  factory SubjectService() => _singleton;

  Future<List<Subject>> getByExamId(int examId) async {
    final list = await _httpService.getList("$subjectController/$getSubjectsByExamIdEndPoint/$examId");
    return list.map((e) => Subject.fromJson(e)).toList();
  }
}