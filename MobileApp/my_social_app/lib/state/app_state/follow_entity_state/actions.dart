import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/follow_entity_state/follow_state.dart';

@immutable
class AddFollowsAction extends redux.Action{
  final Iterable<FollowState> follows;
  const AddFollowsAction({required this.follows});
}

@immutable
class AddFollowAction extends redux.Action{
  final FollowState follow;
  const AddFollowAction({required this.follow});
}

@immutable
class RemoveFollowAction extends redux.Action{
  final int followId;
  const RemoveFollowAction({required this.followId});
}