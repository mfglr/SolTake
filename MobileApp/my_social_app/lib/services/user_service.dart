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
    const url = "$userController/$updateUserImageEndpoint";
    final request = MultipartRequest("Post", _appClient.generateUri(url));
    request.files.add(await MultipartFile.fromPath("file",file.path));
    await _appClient.send(request);
  }
  Future<Uint8List> removeImage()
   => _appClient.getBytes("$userController/$removeUserImageEndpoint");
  Future<void> updateName(String name)
    => _appClient.put("$userController/$updateNameEndpoint",body: {'name' : name});
  Future<void> follow(int followedId)
    => _appClient.put(
      "$userController/$followEndPoint",
      body: {'followedId': followedId}
    );
  Future<void> unfollow(int followedId)
    => _appClient.put(
      "$userController/$unfollowEndPoint",
      body: {'followedId': followedId}
    );
  Future<void> removeFollower(int followerId)
    => _appClient.put(
      "$userController/$removeFollowerEndPoint",
      body: {'followerId': followerId.toString()}
    );
    
  Future<void> addSearched(int searchedId)
     => _appClient.put(
      "$userController/$addUserSearchedEndpoint",
      body: {
        'searchedId': searchedId
      }
    );
  Future<void> removeSearched(int searchedId)
    => _appClient.put(
      "$userController/$removeUserSearchedEndpoint",
      body: {
        'searchedId': searchedId
      }
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
  
  Future<Iterable<User>> getFollowersById(int id,int? lastValue,int? take,bool isDescending) async {
    final endPoint = "$userController/$getFollowersByIdEndPoint/$id";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }
 
  Future<Iterable<User>> getFollowedsById(int id, int? lastValue, int? take,bool isDescending) async {
    final endPoint = "$userController/$getFollowedsByIdEndPoint/$id";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getNotFolloweds(int id,int? lastValue, int? take,bool isDescending) async {
    final endpoint = "$userController/$getNotFollowedsEndpoint/$id";
    final url = _appClient.generatePaginationUrl(endpoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getRequesters(int? lastValue, int? take,bool isDescending) async {
    const endPoint = "$userController/$getRequestersEndPoint";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getRequesteds(int? lastValue, int? take,bool isDescending) async {
    const endPoint = "$userController/$getRequestedsEndPoint";
    final url = _appClient.generatePaginationUrl(endPoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> search(String key, int? lastValue, int? take,bool isDescending) async {
    const url = "$userController/$searchUserEndPoint";
    final body = {'key':key,'lastValue':lastValue,'take':take,'isDescending':isDescending};
    final list = (await _appClient.post(url,body: body)) as List;
    return list.map((item) => User.fromJson(item));
  }

  Future<Iterable<User>> getSearcheds(int? lastValue,int? take,bool isDescending) async {
    const endpoint = "$userController/$getSearchedsEndpoint";
    final url = _appClient.generatePaginationUrl(endpoint, lastValue, take,isDescending);
    final list = (await _appClient.get(url)) as List;
    return list.map((item) => User.fromJson(item));
  }


}