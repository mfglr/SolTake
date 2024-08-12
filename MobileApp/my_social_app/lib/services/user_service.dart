import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_endpoints.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/app_client.dart';

class UserService{
  final AppClient _appClient;
  
  UserService._(this._appClient);
  static final UserService _singleton = UserService._(AppClient());
  factory UserService() => _singleton;

  Future<void> updateImage(XFile file) async {
    String url = "$userController/$updateUserImageEndpoint";
    MultipartRequest request = MultipartRequest("Post", _appClient.generateUri(url));
    request.files.add(await MultipartFile.fromPath("file",file.path));
    await _appClient.send(request);
  }

  Future<void> updateName(String name)
    => _appClient.put("$userController/$updateNameEndpoint",body: {'name' : name});

  Future<Uint8List> removeImage()
   => _appClient.getBytes("$userController/$removeUserImageEndpoint");

  Future<void> makeFollowRequest(int requestedId)
    => _appClient.put(
      "$userController/$makeFollowRequestEndPoint",
      body: {'requestedId': requestedId}
    );

  Future<void> cancelFollowRequest(int requesterId)
    => _appClient.put(
      "$userController/$cancelFollowRequestEndPoint",
      body: {'requesterId': requesterId}
    );

  Future<void> removeFollower(int followerId)
    => _appClient.put(
      "$userController/$removeFollowerEndPoint",
      body: {'followerId': followerId.toString()}
    );

  Future<User> getById(int id)
   => _appClient
        .get("$userController/$getUserByIdEndPoint/$id")
        .then((json) => User.fromJson(json));

  Future<User> getByUserName(String userName)
    => _appClient
        .get("$userController/$getUserByUserNameEndpoint/$userName")
        .then((json) => User.fromJson(json));

  Future<Uint8List> getImageById(int id)
    => _appClient.getBytes("$userController/$gerUserImageByIdEndPoint/$id");

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