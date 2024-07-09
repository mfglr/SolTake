import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/providers/states/account_state.dart';
import 'package:my_social_app/models/token.dart';
part 'account.g.dart';

@JsonSerializable()
class Account{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String email;
  final bool emailConfirmed;
  final Token token;

  Account(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.token
  );

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  AccountState toAccountState() => AccountState(
    id,
    createdAt,
    updatedAt,
    userName,
    email,
    emailConfirmed, 
    token.refreshToken
  );
}