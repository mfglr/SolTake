import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/middlewares.dart';
import 'package:soltake_broker/state/app_state/reducers.dart';

final store = Store(
  reducers,
  initialState: AppState(
    login: null,
  ),
  middleware: [
    //login middlewares
    loginByPasswordMiddleware,
    loginByRefreshTokenMiddleware,
    loginByStorageMiddleware,
  ]
);