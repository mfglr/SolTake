import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
part 'account.g.dart';

@JsonSerializable()
class Account{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String email;
  final String userName;
  final bool emailConfirmed;
  final String accessToken;
  final String refreshToken;

  Account(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.accessToken,
    this.refreshToken
  );

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
  
  AccountState toAccountState()
    => AccountState(id, createdAt, updatedAt, email, userName, emailConfirmed,refreshToken);
}