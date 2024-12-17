import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/active_account_page.dart';
import 'package:my_social_app/state/pagination/pagination.dart';


@immutable
class AppAction{
  const AppAction();
}



class ChangeAccessTokenAction extends AppAction{
  final String? payload;
  const ChangeAccessTokenAction({required this.payload});
}

class ChangeAccountStateAction extends AppAction{
  final AccountState? payload;
  const ChangeAccountStateAction({required this.payload});
}

@immutable
class ApplicationSuccessfullyInitAction extends AppAction{
  const ApplicationSuccessfullyInitAction();
}

@immutable
class ChangeActiveAccountPageAction extends AppAction{
  final ActiveAccountPage payload;
  const ChangeActiveAccountPageAction({required this.payload});
}

@immutable
class NextExamsAction extends AppAction{
  const NextExamsAction();
}
@immutable
class UpdateExamsAction extends AppAction{
  final Pagination payload;
  const UpdateExamsAction({required this.payload});
}



@immutable
class ClearStateAction extends AppAction{
  const ClearStateAction();
}
