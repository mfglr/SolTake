import 'package:json_annotation/json_annotation.dart';
part 'token.g.dart';

@JsonSerializable()
class Token{
  final String accessToken;
  final DateTime expirationDateOfAccessToken;
  final String refreshToken;
  final DateTime expirationDateOfRefreshToken;

  const Token(this.accessToken,this.expirationDateOfAccessToken,this.refreshToken,this.expirationDateOfRefreshToken);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}