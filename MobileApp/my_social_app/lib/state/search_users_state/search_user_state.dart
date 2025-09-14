import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/packages/entity_state/entity.dart';

class SearchUserState extends Entity<int> implements Avatar{
  final String userName;
  final String? name;
  final Multimedia? image;

  SearchUserState({
    required super.id,
    required this.userName,
    required this.name,
    required this.image
  });
  
  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => id;
}