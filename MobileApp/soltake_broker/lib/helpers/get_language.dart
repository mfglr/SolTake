import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:soltake_broker/models/languages.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';

String getLanguage(BuildContext context){
  final store = StoreProvider.of<AppState>(context,listen: false);
  return
    store.state.login.login?.language ?? 
    Languages.language(PlatformDispatcher.instance.locale.languageCode);
}

String getLanguageByStore(Store<AppState> store){
  return
    store.state.login.login?.language ?? 
    Languages.language(PlatformDispatcher.instance.locale.languageCode);
}