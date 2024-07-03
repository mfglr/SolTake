import 'dart:typed_data';

import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_endpoints.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/http/http_service.dart';

class UserService{
  final HttpService _httpService;
  
  UserService._(this._httpService);
  static final UserService _singleton = UserService._(HttpService());
  factory UserService() => _singleton;

  Future<User> get() async {
    String url = "$userController/$getUserEndPoint";
    return User.fromJson(await _httpService.get(url));
  }
 
  Future<User> getById(String id) async {
    final String url = "$userController/$getUserByIdEndPoint/$id";
    return User.fromJson(await _httpService.get(url));
  }

  Future<Uint8List> getImage() async {
    String url = "$userController/$getUserImageEndPoint";
    return await _httpService.readBytes(url);
  }

  Future<Uint8List> getImageById(String id) async {
    String url = "$userController/$gerUserImageByIdEndPoint/$id";
    return await _httpService.readBytes(url);
  }

  Future<List<UserState>> getFollowers({String? lastId}) async{
    String url = "$userController/$getFollowersEndPoint";
    return (await _httpService.getList(lastId != null ? "$url?lastId=$lastId" : url)).map(
      (item) => UserState.fromJson(item)
    ).toList();
  }

   Future<List<UserState>> getFolloweds({String? lastId}) async{
    String url = "$userController/$getFollowedsEndPoint";
    return (await _httpService.getList(lastId != null ? "$url?lastId=$lastId" : url)).map(
      (item) => UserState.fromJson(item)
    ).toList();
  }


}