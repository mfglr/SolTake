import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

abstract class UserItem extends Entity<int> implements Avatar {
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;

  @override
  Multimedia? get avatar => image;
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