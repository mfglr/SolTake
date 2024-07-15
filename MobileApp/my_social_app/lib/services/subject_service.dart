import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/subjcet_endpoints.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/services/app_client.dart';

class SubjectService{
  final AppClient _appClient;
  
  SubjectService._(this._appClient);
  static final SubjectService _singleton = SubjectService._(AppClient());
  factory SubjectService() => _singleton;

  Future<List<Subject>> getByExamId(int examId) async {
    final list = await _appClient.get("$subjectController/$getSubjectsByExamIdEndPoint/$examId");
    return list.map((e) => Subject.fromJson(e)).toList();
  }
}