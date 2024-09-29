import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';

String getLanguageCode(BuildContext context){
  final store = StoreProvider.of<AppState>(context,listen: false);
  return store.state.accountState!.language ?? PlatformDispatcher.instance.locale.languageCode;
}