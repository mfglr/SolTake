import 'package:json_annotation/json_annotation.dart';
part 'account_state.g.dart';

@JsonSerializable()
class AccountState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String email;
  final bool emailConfirmed;
  final String refreshToken;

  AccountState(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.refreshToken
  );

  String formatUserName() => userName.length <= 10 ? userName : "${userName.substring(0,10)}...";

  Map<String, dynamic> toJson() => _$AccountStateToJson(this);
  factory AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);

  AccountState updateUsername(String value)
    => AccountState(id, createdAt, updatedAt, value, email, emailConfirmed, refreshToken);
  AccountState updateEmail(String value)
    => AccountState(id, createdAt, updatedAt, userName, value, emailConfirmed, refreshToken);
  AccountState confirmEmail() =>
    AccountState(id, createdAt, updatedAt, userName, email, true, refreshToken);
  AccountState updateRefreshToken(String value)
    => AccountState(id, createdAt, updatedAt, userName, email, emailConfirmed, value);
}