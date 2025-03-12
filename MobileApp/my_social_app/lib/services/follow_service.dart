import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/follows_endpoint.dart';
import 'package:my_social_app/models/follow.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class FollowService {
  final AppClient _appClient;

  const FollowService._(this._appClient);
  static final FollowService _singleton = FollowService._(AppClient());
  factory FollowService() => _singleton;

  Future<IdResponse> follow(int followedId) => 
    _appClient
      .post("$followController/$followEndpoint", body: { 'followedId': followedId })
      .then((json) => IdResponse.fromJson(json));

  Future<void> unfollow(int followedId) => 
    _appClient
      .delete("$followController/$unfollowEndPoint/$followedId");

  Future<void> removeFollower(int followerId) => 
    _appClient
      .delete("$followController/$removeFollowerEndPoint/$followerId");

  Future<Iterable<Follow>> getFollowersByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$followController/$getFollowersByUserIdEndPoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Follow.fromJson(item)));
 
  Future<Iterable<Follow>> getFollowedsByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$followController/$getFollowedsByUserIdEndPoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Follow.fromJson(item)));
}