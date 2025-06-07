import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/services/login_storage.dart';
import 'package:soltake_broker/services/user_service.dart';

Future<void> loginByRefreshToken() async {
  var login = await LoginStorage().get();
  if(login != null){
    var newLogin = await UserService().loginByRefreshtoken(login.id, login.refreshToken);
    await LoginStorage().set(newLogin.toLoginState());
    UserService().removeRefreshTokens(newLogin.refreshToken);
    AppClient().changeAccessToken(newLogin.accessToken);
  }
}
