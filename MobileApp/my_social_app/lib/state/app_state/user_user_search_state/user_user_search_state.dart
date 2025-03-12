import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

class UserUserSearchState extends BaseEntity<int> implements Avatar  {
  final int searchedId;
  final String userName;
  final String? name;
  final Multimedia? image;

  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => searchedId;

  UserUserSearchState({
    required super.id,
    required this.searchedId,
    required this.userName,
    required this.name,
    required this.image
  });
  
}