import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soltake_broker/helpers/login_by_refresh_token.dart';
import 'package:soltake_broker/state/app_state/store.dart';
import 'package:soltake_broker/views/app_page.dart';
import 'package:flutter_redux/flutter_redux.dart';


Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvironmentVariables();
  await loginByRefreshToken();

  runApp(const SolTakeBroker());
}

class SolTakeBroker extends StatelessWidget {
  const SolTakeBroker({super.key});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'SolTake Broker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: AppPage(),
      ),
    );
  }
}
