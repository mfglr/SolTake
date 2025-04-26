import 'package:my_social_app/state/app_state/user_item.dart';

class StoryUserViewState extends UserItem {
  final DateTime createdAt;
  StoryUserViewState({
    required super.id,
    required this.createdAt,
    required super.userId,
    required super.userName,
    required super.name,
    required super.image
  });

}