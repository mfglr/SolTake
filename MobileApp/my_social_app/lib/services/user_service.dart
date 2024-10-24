import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_endpoints.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/follow.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/models/user_search.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/pagination/page.dart';

class UserService{
  final AppClient _appClient;
  
  UserService._(this._appClient);
  static final UserService _singleton = UserService._(AppClient());
  factory UserService() => _singleton;

  Future<String> _readResponse(HttpClientResponse response) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  Future<HttpClientRequest> _createUpdateImageRequest(XFile file, void Function(double) callback) async{
    const url = "$userController/$updateUserImageEndpoint";
    final request = MultipartRequest("Post", _appClient.generateUri(url));
    request.files.add(await MultipartFile.fromPath("file",file.path));

    var stream = request.finalize();
    var length = request.contentLength;

    var r = await HttpClient().postUrl(_appClient.generateUri(url));
    r.headers.set(HttpHeaders.contentTypeHeader, request.headers[HttpHeaders.contentTypeHeader]!);
    r.headers.set(HttpHeaders.authorizationHeader, "Bearer ${store.state.accessToken}");
    r.headers.set(HttpHeaders.acceptLanguageHeader, store.state.accountState?.language ?? PlatformDispatcher.instance.locale.languageCode);

    var byteCount = 0;
    await r.addStream(
      stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data,sink){
            sink.add(data);
            byteCount += data.length;
            callback(byteCount / length);
          }
        )  
      )
    );
    return r;
  }
  Future<void> updateImage(XFile file,void Function(double) callback) async {
    var request = await _createUpdateImageRequest(file,callback);
    var response = await request.close();
    if(response.statusCode >= 400){
      throw BackendException(message: await _readResponse(response), statusCode: response.statusCode);
    }
  }
  
  Future<Uint8List> removeImage() => 
    _appClient
      .getBytes("$userController/$removeUserImageEndpoint");
  
  Future<void> updateName(String name) => 
    _appClient
      .put("$userController/$updateNameEndpoint",body: {'name' : name});
  
  Future<void> updateBiography(String biography) =>
     _appClient
      .put("$userController/$updateBiographyEndpoint",body: {'biography': biography});
  
  Future<Follow> follow(int followedId) => 
    _appClient
      .post("$userController/$followEndPoint", body: { 'followedId': followedId })
      .then((json) => Follow.fromJson(json));

  Future<void> unfollow(int followedId) => 
    _appClient
      .delete("$userController/$unfollowEndPoint/$followedId");
  
  Future<void> removeFollower(int followerId) => 
    _appClient
      .delete("$userController/$removeFollowerEndPoint/$followerId");
    
  Future<UserSearch> addSearcher(int searchedId) => 
    _appClient
      .post("$userController/$addUserSearcherEndpoint", body: { 'searchedId': searchedId })
      .then((json) => UserSearch.fromJson(json));

  Future<void> removeSearcher(int searchedId) => _appClient.delete("$userController/$removeUserSearcherEndpoint/$searchedId");

  Future<User> getById(int id) => 
    _appClient
      .get("$userController/$getUserByIdEndPoint/$id")
      .then((json) => User.fromJson(json));

  Future<User> getByUserName(String userName) =>
    _appClient
      .get("$userController/$getUserByUserNameEndpoint/$userName")
      .then((json) => User.fromJson(json));
  
  Future<Uint8List> getImageById(int id) => 
    _appClient
      .getBytes("$userController/$gerUserImageByIdEndPoint/$id");
  
  Future<Iterable<Follow>> getFollowersById(int id, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$userController/$getFollowersByIdEndPoint/$id", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Follow.fromJson(item)));
 
  Future<Iterable<Follow>> getFollowedsById(int id, Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$userController/$getFollowedsByIdEndPoint/$id", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => Follow.fromJson(item)));

  Future<Iterable<User>> getNotFolloweds(int id, Page page) =>
   _appClient
    .get(_appClient.generatePaginationUrl("$userController/$getNotFollowedsEndpoint/$id", page))
    .then((json) => json as List)
    .then((list) => list.map((item) => User.fromJson(item)));

  Future<Iterable<User>> search(String key, Page page) =>
    _appClient
      .post(
        "$userController/$searchUserEndPoint",
        body: {
          'key': key,
          'offset': page.offset,
          'take': page.take,
          'isDescending': page.isDescending
        }
      )
      .then((json) => json as List)
      .then((list) => list.map((item) => User.fromJson(item)));

  Future<Iterable<UserSearch>> getSearcheds(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$userController/$getSearchedsEndpoint",page))
      .then((json) => json as List)
      .then((list) => list.map((item) => UserSearch.fromJson(item)));

  Future<Iterable<User>> getCreateConversationPageUsers(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$userController/$getCreateConversationPageUsersEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => User.fromJson(item)));
}