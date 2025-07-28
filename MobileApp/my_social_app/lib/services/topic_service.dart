import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class TopicService{
  static const String _controller = "Topics";
  final AppClient _appClient;
  
  TopicService._(this._appClient);
  static final TopicService _singleton = TopicService._(AppClient());
  factory TopicService() => _singleton;

  Future<Iterable<Topic>> getBySubjectId(int subjectId, Page page)
    => _appClient
      .get(_appClient.generatePaginationUrl("$_controller/GetBySubjectId/$subjectId", page))
      .then((json) => json as List)
      .then((list) => list.map((e) => Topic.fromJson(e)));


}