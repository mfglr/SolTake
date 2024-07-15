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

  Future<Uint8List> getImage() async {
    return await _appClient.getBytes("$userController/$getUserImageEndPoint");
  }

  Future<Uint8List> getImageById(int id) async {
    String url = "$userController/$gerUserImageByIdEndPoint/$id";
    return await _appClient.getBytes(url);
  }

  Future<List<User>> getFollowers({int? lastId}) async{
    String url = "$userController/$getFollowersEndPoint";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List; 
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> getFollowersById(int id, {int? lastId}) async {
    String url = "$userController/$getFollowersByIdEndPoint/$id";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> getFolloweds({int? lastId}) async{
    String url = "$userController/$getFollowedsEndPoint";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> getFollowedsById(int id, {int? lastId}) async {
    String url = "$userController/$getFollowedsByIdEndPoint/$id";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> getRequesters({int? lastId}) async {
    String url = "$userController/$getRequestersEndPoint";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> getRequesteds({int? lastId}) async {
    String url = "$userController/$getRequestedsEndPoint";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }

  Future<List<User>> search(String key, {int? lastId}) async {
    String url = "$userController/$searchUserEndPoint/$key";
    final list = (await _appClient.get(lastId != null ? "$url?lastId=$lastId" : url)) as List;
    return list.map((item) => User.fromJson(item)).toList();
  }
}