import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/topic_endpoints.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/services/app_client.dart';

class TopicService{
  final AppClient _appClient;
  
  TopicService._(this._appClient);
  static final TopicService _singleton = TopicService._(AppClient());
  factory TopicService() => _singleton;

  Future<List<Topic>> getBySubjectId(int subjectId) async {
    final list = (await _appClient.get("$topicController/$getTopicsBySubjectIdEndPoint/$subjectId")) as List;
    return list.map((e) => Topic.fromJson(e)).toList();
  }

}