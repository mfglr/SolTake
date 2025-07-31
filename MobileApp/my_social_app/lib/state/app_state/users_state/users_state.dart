import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_collection.dart';

@immutable
class UsersState {
  final EntityCollection<int, UserState> users;

  const UsersState({
    required this.users
  });

  UsersState load(int id) => UsersState(users: users.loading(id));
  UsersState success(UserState user) => UsersState(users: users.success(user));
  UsersState failed(int id) => UsersState(users: users.failed(id));
  UsersState notFound(int id) => UsersState(users: users.notFound(id));
  
}