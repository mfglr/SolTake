import 'package:my_social_app/models/follow.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart';

class FollowService {
  static const _controller = "Follows";
  final AppClient _appClient;

  const FollowService._(this._appClient);
  static final FollowService _singleton = FollowService._(AppClient());
  factory FollowService() => _singleton;

  Future<IdResponse> follow(int followedId) => 
    _appClient
      .post("$_controller/Follow", body: { 'followedId': followedId })
      .then((json) => IdResponse.fromJson(json));

  Future<void> unfollow(int followedId) => 
    _appClient
      .delete("$_controller/Unfollow/$followedId");

  Future<void> removeFollower(int followerId) => 
    _appClient
      .delete("$_controller/RemoveFollower/$followerId");

  Future<Iterable<Follow>> getFollowersByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controller/GetFollowersByUserId/$userId", page))
      .then((json) => json as Iterable)
      .then((list) => list.map((item) => Follow.fromJson(item)));
 
  Future<Iterable<Follow>> getFollowedsByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$_controller/GetFollowedsByUserId/$userId", page))
      .then((json) => json as Iterable)
      .then((list) => list.map((item) => Follow.fromJson(item)));
}