import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/user_user_block_state/user_user_block_state.dart';
part 'user_user_block.g.dart';

@immutable
@JsonSerializable()
class UserUserBlock {
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const UserUserBlock({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
    });

  factory UserUserBlock.fromJson(Map<String, dynamic> json) => _$UserUserBlockFromJson(json);
  Map<String, dynamic> toJson() => _$UserUserBlockToJson(this);

  UserUserBlockState toState() =>
    UserUserBlockState(
      id: id,
      userId: userId,
      userName: userName,
      name: name,
      image: image
    );
}