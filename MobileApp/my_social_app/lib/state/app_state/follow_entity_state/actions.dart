import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';

@immutable
class AddFollowsAction extends AppAction{
  final Iterable<FollowState> follows;
  const AddFollowsAction({required this.follows});
}

@immutable
class AddFollowAction extends AppAction{
  final FollowState follow;
  const AddFollowAction({required this.follow});
}

@immutable
class RemoveFollowAction extends AppAction{
  final num followId;
  const RemoveFollowAction({required this.followId});
}