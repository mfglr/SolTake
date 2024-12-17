import 'package:my_social_app/state/app_state/access_token_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';

String? changeAccessTokenReducer(String? prev, AppAction action)
  => action is ChangeAccessTokenAction ? action.accessToken : prev;