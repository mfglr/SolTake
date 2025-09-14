import 'package:my_social_app/models/story_user_view.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/packages/entity_state/page.dart';

class StoryUserViewService {
  static const _controllerName = "StoryUserViews";
  final AppClient _appClient;

  const StoryUserViewService._(this._appClient);
  static final StoryUserViewService _singleton = StoryUserViewService._(AppClient());
  factory StoryUserViewService() => _singleton;

  Future<StoryUserView> create(int storyId) =>
    _appClient
      .post("$_controllerName/Create",body: {'storyId': storyId})
      .then((json) => StoryUserView.fromJson(json));

  Future<Iterable<StoryUserView>> getStoryUserViewsByStoryId(int storyId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controllerName/GetStoryUserViewsByStoryId/$storyId", page))
      .then((json) => json as Iterable)
      .then((iterable) => iterable.map((e) => StoryUserView.fromJson(e)));
}