import 'package:my_social_app/state/pagination/has_pagination_property.dart';

class FollowedState extends HasPaginationProperty<num>{
  final int followedId;
  final DateTime createdAt;
  
  const FollowedState({
    required super.key,
    required this.followedId,
    required this.createdAt
  });
}