import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/token.dart';
part "login_response.g.dart";

@JsonSerializable()
class LoginResponse{
  String id;
  String email;
  String userName;
  bool emailConfirmed;
  Token token;

  LoginResponse(this.id,this.email,this.userName,this.emailConfirmed,this.token);
  
  void confirmEmail() => emailConfirmed = true;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}