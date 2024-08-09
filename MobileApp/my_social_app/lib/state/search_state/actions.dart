import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class GetFirstPageSearchingUsersIfNoPageAction extends redux.Action{
  const GetFirstPageSearchingUsersIfNoPageAction();
}
@immutable
class GetFirstPageSearchingUsersAction extends redux.Action{
  final String key;
  const GetFirstPageSearchingUsersAction({required this.key});
}
@immutable
class AddFirstPageSearchingUsersAction extends redux.Action{
  final String key;
  final Iterable<int> userIds;
  const AddFirstPageSearchingUsersAction({required this.key,required this.userIds});
}

@immutable
class GetNextPageSearchingUsersIfReadyAction extends redux.Action{
  const GetNextPageSearchingUsersIfReadyAction();
}
@immutable
class GetNextPageSearchingUsersAction extends redux.Action{
  const GetNextPageSearchingUsersAction();
}
@immutable
class AddNextPageSearchingUsersAction extends redux.Action{
  final Iterable<int> userIds;
  const AddNextPageSearchingUsersAction({required this.userIds});
}

@immutable
class ClearSearchingAction extends redux.Action{
  const ClearSearchingAction();
}