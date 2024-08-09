import 'dart:typed_data';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_endpoints.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/app_client.dart';

class UserService{
  final AppClient _appClient;
  
  UserService._(this._appClient);
  static final UserService _singleton = UserService._(AppClient());
  factory UserService() => _singleton;

  Future<void> makeFollowRequest(int requestedId) async {
    await _appClient.put(
      "$userController/$makeFollowRequestEndPoint",
      body: {'requestedId': requestedId}
    );
  }

  Future<void> cancelFollowRequest(int requesterId) async {
    await _appClient.put(
      "$userController/$cancelFollowRequestEndPoint",
      body: {'requesterId': requesterId}
    );
  }

  Future<void> removeFollower(int followerId) async {
    await _appClient.put(
      "$userController/$removeFollowerEndPoint",
      body: {'followerId': followerId.toString()}
    );
  }

  Future<User> get() async {
    return User.fromJson( await _appClient.get("$userController/$getUserEndPoint") );
  }
 
  Future<User> getById(int id) async {
    return User.fromJson(await _appClient.get("$userController/$getUserByIdEndPoint/$id"));
  }

  Future<User> getByUserName(String userName) async
    => User.fromJson(await _appClient.get("$userController/$getUserByUserNameEndpoint/$userName"));

  Future<Uint8List> getImage() async {
    return await _appClient.getBytes("$userController/$getUserImageEndPoint");
  }

  Future<Uint8List> getImageById(int id) async {
    String url = "$userController/$gerUserImageByIdEndPoint/$id";
    return await _appClient.getBytes(url);
  }

  Future<Iterable<User>> getFollowersById(int id, int? lastValue, int? take) async {
    String endPoint = "$userController/$getFollowersByIdEndPoint/$id";
    String url = _appClient.generatePaginationUrl(endPoint, lastValue, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }
 
  Future<Iterable<User>> getFollowedsById(int id, int? lastValue, int? take) async {
    String endPoint = "$userController/$getFollowedsByIdEndPoint/$id";
    String url = _appClient.generatePaginationUrl(endPoint, lastValue, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getRequesters(int? lastValue, int? take) async {
    String endPoint = "$userController/$getRequestersEndPoint";
    String url = _appClient.generatePaginationUrl(endPoint, lastValue, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getRequesteds(int? lastValue, int? take) async {
    String endPoint = "$userController/$getRequestedsEndPoint";
    String url = _appClient.generatePaginationUrl(endPoint, lastValue, take);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> search(String key, int? lastValue, int? take) async {
    String url = "$userController/$searchUserEndPoint";
    final list = (await _appClient.post(url,body: {'key':key,'lastValue':lastValue,'take':take})) as List;
    return list.map((item) => User.fromJson(item));
  }
}