import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';
import 'package:soltake_broker/views/application_loading_page.dart';
import 'package:soltake_broker/views/login/login_page.dart';
import 'package:soltake_broker/views/root_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
   late final Timer _timer;
  @override
  void initState() {
    final store = StoreProvider.of<AppState>(context,listen: false);
    store.dispatch(LoginByRefreshTokenAction());
    _timer = Timer.periodic(
      Duration(minutes: int.parse(dotenv.env['accessTokenDuration']!)),
      (timer) => store.dispatch(LoginByRefreshTokenAction())
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,LoginContainer>(
      converter: (store) => store.state.login,
      builder: (context,container){
        if(container.isLoading) return const ApplicationLoadingPage();
        if(container.login == null) return const LoginPage();
        return RootPage();
      },
    );
  }
}