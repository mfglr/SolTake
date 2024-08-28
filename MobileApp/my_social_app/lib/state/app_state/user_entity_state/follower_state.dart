import 'package:my_social_app/state/pagination/has_pagination_property.dart';

class FollowerState extends HasPaginationProperty<num>{
  final int followerId;
  final DateTime createdAt;

  const FollowerState({
    required super.key,
    required this.followerId,
    required this.createdAt
  });
}