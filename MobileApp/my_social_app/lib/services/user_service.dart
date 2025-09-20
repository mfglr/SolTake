import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app_file/app_file.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_endpoints.dart';
import 'package:my_social_app/models/login.dart';
import 'package:my_social_app/models/remove_user_image_response.dart';
import 'package:my_social_app/models/search_user.dart';
import 'package:my_social_app/models/update_name_response.dart';
import 'package:my_social_app/models/update_user_image_response.dart';
import 'package:my_social_app/models/update_user_name_response.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/custom_packages/entity_state/page.dart';
import 'package:my_social_app/views/login/widgets/google_login_button.dart';

class UserService{
  final AppClient _appClient;
  
  UserService._(this._appClient);
  static final UserService _singleton = UserService._(AppClient());
  factory UserService() => _singleton;
 
  Future<Login> create(String email, String password, String passwordConfirmation) =>
    _appClient
      .post(
        "$userController/$createEndPoint",
        body: {
          'email':email,
          'password':password,
          "passwordConfirm":passwordConfirmation
        }
      )
      .then((json) => Login.fromJson(json));
  
  Future<Login> loginByPassword(String emailOrUserName, String password) =>
    _appClient
      .post(
        "$userController/$loginByPasswordEndPoint",
        body: {
          'emailOrUserName':emailOrUserName,
          'password':password
        }
      )
      .then((json) => Login.fromJson(json));
  
  Future<Login> loginByRefreshtoken(num id,String token) =>
    _appClient
      .post(
        "$userController/$loginByRefreshTokenEndPoint",
        body: { 'id': id.toString(),'token': token}
      )
      .then((json) => Login.fromJson(json));

  Future removeRefreshTokens(String token) =>
    _appClient.put("$userController/removeRefreshTokens", body: { 'token': token });

  Future<Login> loginByGoogle(String accessToken) =>
    _appClient
      .post(
        "$userController/$loginByGoogleEndpoint",
        body: { 'accessToken': accessToken }
      )
      .then((json) => Login.fromJson(json))
      .catchError((e) async {
        await googleSignIn.disconnect();
        throw e;
      });

  Future<void> updateEmailVerificationToken() =>
    _appClient.put("$userController/$updateEmailVerificationTokenEndPoint");

  Future<void> verifyEmail(String token) =>
    _appClient
      .put(
        "$userController/$verifyEmailEntPoint",
        body: { 'token': token }
      );

  Future resetPassword(String email, String token, String password, String passwordConfirm) =>
    _appClient
      .put(
        "$userController/$resetPasswordEndpoint",
        body: { 'email': email, 'token': token, 'password': password, 'passwordConfirm': passwordConfirm }
      );
  
  Future generateResetPasswordToken(String email) =>
    _appClient
      .put(
        "$userController/$generateResetPasswordTokenEndpoint",
        body: { 'email':email, }
      );

  Future<Login> updateEmail(String email) =>
    _appClient
      .post("$userController/$updateEmailEndPoint",body: { 'email': email })
      .then((json) => Login.fromJson(json));

  Future<UpdateUserNameResponse> updateUserName(String userName) =>
    _appClient
      .post("$userController/$updateUserNameEndPoint",body: { 'userName': userName })
      .then((json) => UpdateUserNameResponse.fromJson(json));

  Future<void> updateLanguage(String language) =>
    _appClient
      .put(
        "$userController/$updateLanguageEndpoint",
        body: {'language': language }
      );
  
  Future<void> logOut() =>
    _appClient
      .put("$userController/$logOutEndPoint");

  Future<void> delete() =>
    _appClient
      .delete("$userController/$deleteAccountEndpoint");

  Future<bool> isUserNameExist(String userName) =>
    _appClient
      .get("$userController/$isUserNameExistEndPoint/$userName")
      .then((response) => response as bool);

  Future<void> approvePolicy() =>
    _appClient
      .put("$userController/$approvePrivacyPolicyEndpoint");

  Future<void> approveTermsOfUse() =>
    _appClient
      .put("$userController/$approveTermsOfUseEndpoint");

  Future<UpdateUserImageResponse> updateImage(AppFile image, num userId, void Function(double) callback) async {
    const url = "$userController/$updateUserImageEndpoint";
    final request = MultipartRequest("Post", _appClient.generateUri(url));
    request.files.add(await MultipartFile.fromPath("file",image.file.path,contentType: MediaType.parse(image.contentType)));
    var data = await _appClient.postStream(request, callback);
    return UpdateUserImageResponse.fromJson(jsonDecode(data));
  }
  
  Future<RemoveUserImageResponse> removeImage(int userId) =>
    _appClient
      .post("$userController/$removeUserImageEndpoint")
      .then((json) => RemoveUserImageResponse.fromJson(json));
  
  Future<UpdateNameResponse> updateName(String name) => 
    _appClient
      .post("$userController/$updateNameEndpoint", body: {'name' : name})
      .then((json) => UpdateNameResponse.fromJson(json));
  
  Future<void> updateBiography(String biography) =>
     _appClient
      .put("$userController/$updateBiographyEndpoint",body: {'biography': biography});
  
  Future<User> getById(num id) => 
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

  Future<Iterable<SearchUser>> search(String key, Page page) =>
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
      .then((list) => list.map((item) => SearchUser.fromJson(item)));

  Future<Iterable<User>> getCreateConversationPageUsers(Page page) =>
    _appClient
      .get(_appClient.generatePaginationUrl("$userController/$getCreateConversationPageUsersEndpoint", page))
      .then((json) => json as List)
      .then((list) => list.map((item) => User.fromJson(item)));
}