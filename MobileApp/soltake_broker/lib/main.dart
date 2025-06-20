import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soltake_broker/global_error_handling.dart';
import 'package:soltake_broker/state/app_state/store.dart';
import 'package:soltake_broker/views/app_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:toastification/toastification.dart';


Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

void addTimeAgo(){
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  timeago.setLocaleMessages('tr_short', timeago.TrShortMessages());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvironmentVariables();
  addTimeAgo();

  FlutterError.onError = (error) {
    handleErrors(error.exception);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    handleErrors(error);
    return true;
  };

  runApp(const SolTakeBroker());
}

class SolTakeBroker extends StatelessWidget {
  const SolTakeBroker({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'SolTake Broker',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: AppPage(),
        ),
      ),
    );
  }
}
