import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

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