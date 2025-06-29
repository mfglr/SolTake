import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/subjcet_endpoints.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class SubjectService{
  final AppClient _appClient;
  
  SubjectService._(this._appClient);
  static final SubjectService _singleton = SubjectService._(AppClient());
  factory SubjectService() => _singleton;

  Future<List<Subject>> getByExamId(num examId, Page page)
    => _appClient
      .get(_appClient.generatePaginationUrl("$subjectController/$getSubjectsByExamIdEndPoint/$examId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Subject.fromJson(e)).toList());

  Future<Subject> getSubjectById(num subjectId)
    => _appClient
      .get("$subjectController/$getSubjectByIdEndpoint/$subjectId")
      .then((json) => Subject.fromJson(json));

  static Future<Iterable<Subject>> search(String? key, Page page) =>
    AppClient()
      .get(AppClient().generatePaginationUrl("$subjectController/Search", page, values: { 'key': key }))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => Subject.fromJson(e)));
}