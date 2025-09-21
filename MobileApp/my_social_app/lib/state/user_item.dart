import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

abstract class UserItem extends Entity<int> implements Avatar {
  final int userId;
  final String userName;
  final String? name;
  final Media? image;

  @override
  Media? get avatar => image;
  @override
  int get avatarId => userId;

  UserItem({
    required super.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });
}