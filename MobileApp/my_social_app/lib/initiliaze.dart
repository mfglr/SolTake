import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/models/login_response.dart';
import 'package:my_social_app/services/injection_container.dart';
import 'package:my_social_app/services/login_service.dart';
import 'package:my_social_app/services/storage/storage.dart';

LoginResponse? account;

Future loadEnvironmentVariables() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
}

Future login() async {
  final service = getIt<LoginService>();
  final storage = getIt<Storage>();

  account = await storage.getLoginResponse();
  if(account != null){
    try{
      account = await service.loginByReshtoken(account!.id,account!.token.refreshToken );
      storage.setLoginResponse(account!);
    }
    catch(e){
      await storage.removeLoginResponse();
      print(e);
    }
  }
}

Future initApplication() async {
  await loadEnvironmentVariables();
  await registerServices();
}

