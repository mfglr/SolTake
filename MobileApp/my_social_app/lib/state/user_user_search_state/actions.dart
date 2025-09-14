import 'package:flutter/cupertino.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/user_user_search_state/user_user_search_state.dart';

@immutable
class CreateUserUserSearchAction extends AppAction{
  final int searchedId;
  const CreateUserUserSearchAction({required this.searchedId});
}
@immutable
class CreateUserUserSearchSuccessAction extends AppAction{
  final UserUserSearchState userUserSearch;
  const CreateUserUserSearchSuccessAction({required this.userUserSearch});
}

@immutable
class RemoveUserUserSearchAction extends AppAction{
  final int searchedId;
  const RemoveUserUserSearchAction({required this.searchedId});
}
@immutable
class RemoveUserUserSearchSuccessAction extends AppAction{
  final int searchedId;
  const RemoveUserUserSearchSuccessAction({required this.searchedId});
}

@immutable
class NextUserUserSearchsAction extends AppAction{
  const NextUserUserSearchsAction();
}
@immutable
class NextUserUserSearchsSuccessAction extends AppAction{
  final Iterable<UserUserSearchState> userUserSearchs;
  const NextUserUserSearchsSuccessAction({required this.userUserSearchs});
}
@immutable
class NextUserUserSearchsFailedAction extends AppAction{
  const NextUserUserSearchsFailedAction();
}