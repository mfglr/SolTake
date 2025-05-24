import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/global_error_handling.dart';
import 'package:my_social_app/services/package_version_service.dart';
import 'package:my_social_app/state/app_state/login_state/login.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/views/app_update_view.dart';
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

late final String packageVersion;
Future _setPackageVersion() 
  => PackageVersionService()
      .getVersion()
      .then((version) => packageVersion = version);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvironmentVariables();
  addTimeAgo();
  await _setPackageVersion();
  
  FlutterError.onError = (error) {
    handleErrors(error.exception);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    handleErrors(error);
    return true;
  };
  
  runApp(
    ToastificationWrapper(
      child: StoreProvider(
        store: store,
        child: StoreConnector<AppState,Login>(
          converter: (store) => store.state.login,
          builder: (context,login) => MaterialApp(
            title: 'SolTake', 
            locale: Locale(login.login?.language ?? PlatformDispatcher.instance.locale.languageCode),
            supportedLocales: const [
              Locale('en'),
              Locale('tr'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const AppUpdateView(),
          ),
        )
      ),
    )
  );
}
