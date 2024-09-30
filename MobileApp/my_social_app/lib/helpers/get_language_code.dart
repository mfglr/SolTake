import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

String getLanguageCode(Store<AppState> store) =>
  store.state.accountState?.language ?? PlatformDispatcher.instance.locale.languageCode;