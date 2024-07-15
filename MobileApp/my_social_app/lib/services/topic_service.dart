import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/topic_endpoints.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/services/http_service.dart';

class TopicService{
  final HttpService _httpService;
  
  TopicService._(this._httpService);
  static final TopicService _singleton = TopicService._(HttpService());
  factory TopicService() => _singleton;

  Future<List<Topic>> getBySubjectId(int subjectId) async {
    final list = await _httpService.getList("$topicController/$getTopicsBySubjectIdEndPoint/$subjectId");
    return list.map((e) => Topic.fromJson(e)).toList();
  }

}