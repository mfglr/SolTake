import 'package:json_annotation/json_annotation.dart';
part 'account_state.g.dart';

@JsonSerializable()
class AccountState{
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;

  AccountState(
    this.id,
    this.createdAt,
    this.updatedAt,
    String userName,
    String email,
    bool emailConfirmed,
    String refreshToken
  ) : 
    _userName = userName, 
    _email = email, 
    _emailConfirmed = emailConfirmed,
    _refreshToken = refreshToken;

  Map<String, dynamic> toJson() => _$AccountStateToJson(this);
  factory AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);

  String _userName;
  String get userName => _userName;
  void updateUsername(String userName) => _userName = userName;
  
  String _email;
  String get email => _email;
  void updateEmail(String email) => _email = email;

  bool _emailConfirmed;
  bool get emailConfirmed => _emailConfirmed;
  void confirmEmail() => _emailConfirmed = true;
  
  String _refreshToken;
  String get refreshToken => _refreshToken;
  void updateRefreshToken(String token) => _refreshToken = token;

  String formatUserName() => userName.length <= 10 ? userName : "${userName.substring(0,10)}...";
}