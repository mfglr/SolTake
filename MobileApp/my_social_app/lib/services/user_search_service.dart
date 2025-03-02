import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_search_endpoints.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/services/app_client.dart';

class UserSearchService{
  final AppClient _appClient;
  
  UserSearchService._(this._appClient);
  static final UserSearchService _singleton = UserSearchService._(AppClient());
  factory UserSearchService() => _singleton;

  Future<IdResponse> create(int searchedId) => 
    _appClient
      .post(
        "$userSearchController/$createUserSearchEndpoint",
        body: { 'searchedId': searchedId }
      )
      .then((json) => IdResponse.fromJson(json));

  Future<void> delete(int searchedId) => 
    _appClient
      .delete("$userSearchController/$delteUserSearchEndpoint/$searchedId");
}