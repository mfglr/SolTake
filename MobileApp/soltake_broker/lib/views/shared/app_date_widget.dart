import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppDateWidget extends StatelessWidget {
  final DateTime dateTime;
  final TextStyle? style;
  const AppDateWidget({
    super.key,
    required this.dateTime,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,String>(
      converter: (store) => store.state.login.login!.language,
      builder: (contex,language) => Text(
        timeago.format(dateTime,locale: '${language}_short'),
        style: style,
      ),
    );
  }
}