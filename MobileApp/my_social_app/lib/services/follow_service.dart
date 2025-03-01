import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/follows_endpoint.dart';
import 'package:my_social_app/models/followed.dart';
import 'package:my_social_app/models/follower.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class FollowService {
  final AppClient _appClient;

  const FollowService._(this._appClient);
  static final FollowService _singleton = FollowService._(AppClient());
  factory FollowService() => _singleton;

  Future<IdResponse> follow(num followedId) => 
    _appClient
      .post("$followController/$followEndpoint", body: { 'followedId': followedId })
      .then((json) => IdResponse.fromJson(json));

  Future<void> unfollow(num followedId) => 
    _appClient
      .delete("$followController/$unfollowEndPoint/$followedId");

  Future<void> removeFollower(num followerId) => 
    _appClient
      .delete("$followController/$removeFollowerEndPoint/$followerId");

  Future<Iterable<Follower>> getFollowersByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$followController/$getFollowersByUserIdEndPoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Follower.fromJson(item)));
 
  Future<Iterable<Followed>> getFollowedsByUserId(int userId, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$followController/$getFollowedsByUserIdEndPoint/$userId", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Followed.fromJson(item)));
}