import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/models/languages.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';

class LanguageWidget extends StatelessWidget {
  final Widget Function(String) child;
  const LanguageWidget({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,String?>(
      converter: (store) => store.state.login.login?.language, 
      builder: (context,language) => child(
        language ??
        Languages.language(PlatformDispatcher.instance.locale.languageCode)
      ),
    );
  }
}