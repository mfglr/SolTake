import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/models/languages.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

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