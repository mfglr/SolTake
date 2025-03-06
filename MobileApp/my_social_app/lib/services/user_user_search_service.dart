import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/user_user_visit_endpoints.dart';
import 'package:my_social_app/models/id_response.dart';
import 'package:my_social_app/models/user_user_search.dart';
import 'package:my_social_app/services/app_client.dart';

class UserUserSearchService{
  final AppClient _appClient;
  
  UserUserSearchService._(this._appClient);
  static final UserUserSearchService _singleton = UserUserSearchService._(AppClient());
  factory UserUserSearchService() => _singleton;

  Future<IdResponse> create(int searchedId) => 
    _appClient
      .post(
        "$userSearchController/$createUserUserSearchEndpoint",
        body: { 'searchedId': searchedId }
      )
      .then((json) => IdResponse.fromJson(json));

  Future<void> delete(int searchedId) => 
    _appClient
      .delete("$userSearchController/$deleteUserUserSearchEndpoint/$searchedId");

  Future<Iterable<UserUserSearch>> get() =>
    _appClient
      .get("$userSearchController/$getUserUserSearchsEndpoint")
      .then((json) => json as List)
      .then((list) => list.map((json) => UserUserSearch.fromJson(json)));
}