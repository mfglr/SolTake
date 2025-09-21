import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

class SearchUserState extends Entity<int> implements Avatar{
  final String userName;
  final String? name;
  final Media? image;

  SearchUserState({
    required super.id,
    required this.userName,
    required this.name,
    required this.image
  });
  
  @override
  Media? get avatar => image;
  @override
  int get avatarId => id;
}