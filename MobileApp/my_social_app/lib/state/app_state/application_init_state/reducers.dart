import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/application_init_state/actions.dart';

bool loginSuccessReducer(bool oldState, AppAction action)
  => action is LoginSuccessAction ? true : oldState;

